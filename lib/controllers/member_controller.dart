import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:application/controllers/animes/followed_anime_controller.dart';
import 'package:application/controllers/animes/missed_anime_controller.dart';
import 'package:application/controllers/episodes/followed_episode_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/dtos/refresh_member_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/views/crop_view.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class MemberController {
  static MemberController instance = MemberController();
  final StreamController<MemberDto> streamController =
      StreamController<MemberDto>.broadcast();
  String? identifier;
  MemberDto? member;
  int imageVersion = 0;

  Future<void> init({final bool afterDelete = false}) async {
    identifier =
        SharedPreferencesController.instance.getString('identifier') ??
        await register();
    imageVersion =
        SharedPreferencesController.instance.getInt('imageVersion') ?? 0;

    try {
      await login();
    } on HttpException catch (e) {
      debugPrint('Failed to login: $e');

      if (!afterDelete) {
        // Move the current identifier to old identifier
        final String? oldIdentifier = identifier;
        await SharedPreferencesController.instance.remove('identifier');
        await SharedPreferencesController.instance.remove('imageVersion');

        await SharedPreferencesController.instance.setString(
          'oldIdentifier',
          oldIdentifier!,
        );
        await init(afterDelete: true);
      }
    } on TimeoutException catch (e) {
      debugPrint('Failed to login: $e');
      rethrow;
    } on ClientException catch (e) {
      debugPrint('Failed to login: $e');
      rethrow;
    }
  }

  Future<String> register() async {
    final Response response = await HttpRequest().post('/v1/members/register');

    if (response.statusCode != HttpStatus.created) {
      throw const HttpException('Failed to register');
    }

    final String identifier =
        (jsonDecode(utf8.decode(response.bodyBytes))
                as Map<String, dynamic>)['identifier']
            as String;
    await SharedPreferencesController.instance.setString(
      'identifier',
      identifier,
    );
    Analytics.instance.logSignUp();
    return identifier;
  }

  Future<Response> testLogin(final String identifier) async {
    final Response response = await HttpRequest().post(
      '/v1/members/login',
      body: identifier,
    );

    if (response.statusCode == HttpStatus.notFound) {
      throw const HttpException('Failed to login, identifier not found');
    }

    if (response.statusCode != HttpStatus.ok) {
      throw ClientException('Server error');
    }

    return response;
  }

  Future<void> login({final String? identifier}) async {
    final Response response = await testLogin(identifier ?? this.identifier!);
    final Map<String, dynamic> json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    if (identifier != null) {
      this.identifier = identifier;
      await SharedPreferencesController.instance.setString(
        'identifier',
        identifier,
      );
    }

    member = MemberDto.fromJson(json);
    streamController.add(member!);
    Analytics.instance.logLogin();

    if (identifier != null) {
      await refresh();
    }
  }

  Future<void> refresh() async {
    final Map<String, dynamic> json = await HttpRequest()
        .get<Map<String, dynamic>>('/v1/members/refresh', token: member!.token);

    final RefreshMemberDto refreshedMember = RefreshMemberDto.fromJson(json);

    member = member!.copyWith(
      totalDuration: refreshedMember.totalDuration,
      totalUnseenDuration: refreshedMember.totalUnseenDuration,
    );

    final List<MissedAnimeDto> missedAnimes =
        refreshedMember.missedAnimes.data
            .map(
              (final dynamic e) =>
                  MissedAnimeDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

    final List<AnimeDto> followedAnimes =
        refreshedMember.followedAnimes.data
            .map(
              (final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

    final List<EpisodeMappingDto> followedEpisodes =
        refreshedMember.followedEpisodes.data
            .map(
              (final dynamic e) =>
                  EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

    streamController.add(member!);
    MissedAnimeController.instance.setItems(missedAnimes);
    FollowedAnimeController.instance.setItems(followedAnimes);
    FollowedEpisodeController.instance.setItems(followedEpisodes);
  }

  Future<void> changeImage(final BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? result = await picker.pickImage(source: ImageSource.gallery);
    final Uint8List? bytes = await result?.readAsBytes();

    if (result == null || bytes == null || !context.mounted) {
      return;
    }

    const List<String> allowedFormats = <String>['jpeg', 'png', 'jpg'];

    // Check if the image format is allowed
    if (!allowedFormats.contains(result.path.split('.').last)) {
      await showDialog(
        context: context,
        builder:
            (final BuildContext context) => AlertDialog(
              title: Text(AppLocalizations.of(context)!.invalidImageFormat),
              content: Text(
                AppLocalizations.of(context)!.invalidImageExtension,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.ok),
                ),
              ],
            ),
      );

      return;
    }

    final CropController controller = CropController();

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder:
            (final BuildContext context) =>
                CropView(bytes: bytes, controller: controller),
      ),
    );
  }

  Future<void> updateImage(final Uint8List image) async {
    final Response response = await HttpRequest().postMultipart(
      '/v1/members/image',
      member!.token,
      image,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return updateImage(image);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException('Failed to change image ${response.body}');
    }

    await increaseImageVersion();
  }

  Future<void> increaseImageVersion() async {
    imageVersion++;
    await SharedPreferencesController.instance.setInt(
      'imageVersion',
      imageVersion,
    );
    member = member!.copyWith(hasProfilePicture: true);
    streamController.add(member!);
  }

  Future<String> associateEmail(final String email) async {
    final Response response = await HttpRequest().post(
      '/v1/members/associate-email',
      token: member!.token,
      body: email,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return associateEmail(email);
    }

    if (response.statusCode == HttpStatus.conflict) {
      throw const ConflictEmailException();
    }

    if (response.statusCode != HttpStatus.created) {
      throw const HttpException('Failed to associate email');
    }

    return (jsonDecode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>)['uuid']
        as String;
  }

  Future<String> forgotIdentifier(final String email) async {
    final Response response = await HttpRequest().post(
      '/v1/members/forgot-identifier',
      token: member!.token,
      body: email,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return forgotIdentifier(email);
    }

    if (response.statusCode == HttpStatus.conflict) {
      throw const ConflictEmailException();
    }

    if (response.statusCode != HttpStatus.created) {
      throw const HttpException('Failed to associate email');
    }

    return (jsonDecode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>)['uuid']
        as String;
  }

  Future<void> validateAction(final String uuid, final String code) async {
    final Response response = await HttpRequest().post(
      '/v1/member-actions/validate?uuid=$uuid',
      token: member!.token,
      body: code,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return validateAction(uuid, code);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to validate action');
    }
  }

  Future<void> followAnime(
    final AnimeDto anime, {
    final bool loadMemberData = true,
  }) async {
    if (member!.followedAnimes.contains(anime.uuid)) {
      return;
    }

    final Response response = await HttpRequest().put(
      '/v1/members/animes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followAnime(anime, loadMemberData: loadMemberData);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow anime');
    }

    member!.followedAnimes.add(anime.uuid);

    if (loadMemberData) {
      await refresh();
    } else {
      streamController.add(member!);
    }
  }

  Future<void> unfollowAnime(final AnimeDto anime) async {
    final Response response = await HttpRequest().delete(
      '/v1/members/animes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return unfollowAnime(anime);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to unfollow anime');
    }

    member!.followedAnimes.remove(anime.uuid);
    await refresh();
  }

  Future<void> followAllEpisodes(final AnimeDto anime) async {
    if (!member!.followedAnimes.contains(anime.uuid)) {
      await followAnime(anime, loadMemberData: false);
    }

    final Response response = await HttpRequest().put(
      '/v1/members/follow-all-episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followAllEpisodes(anime);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow all episodes');
    }

    final Map<String, dynamic> json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final List<String> data = List<String>.from(json['data'] as List<dynamic>);

    member!.followedEpisodes.addAll(data);
    await refresh();
  }

  Future<void> followEpisode(
    final AnimeDto? animeDto,
    final EpisodeMappingDto episode, {
    final bool refreshAfterFollow = true,
  }) async {
    if (member!.followedEpisodes.contains(episode.uuid)) {
      return;
    }

    final AnimeDto? anime = animeDto ?? episode.anime;

    if (anime == null) {
      return;
    }

    if (!member!.followedAnimes.contains(anime.uuid)) {
      await followAnime(anime, loadMemberData: false);
    }

    final Response response = await HttpRequest().put(
      '/v1/members/episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': episode.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followEpisode(animeDto, episode);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow episode');
    }

    member!.followedEpisodes.add(episode.uuid);

    if (refreshAfterFollow) {
      await refresh();
    }
  }

  Future<void> unfollowEpisode(final EpisodeMappingDto episode) async {
    final Response response = await HttpRequest().delete(
      '/v1/members/episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': episode.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return unfollowEpisode(episode);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to unfollow episode');
    }

    member!.followedEpisodes.remove(episode.uuid);
    await refresh();
  }
}

class ConflictEmailException implements Exception {
  const ConflictEmailException();
}
