import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:application/controllers/animes/followed_anime_controller.dart';
import 'package:application/controllers/animes/missed_anime_controller.dart';
import 'package:application/controllers/episodes/followed_episode_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/enums/config_property_key.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/dtos/refresh_member_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/views/crop_view.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MemberController {
  static MemberController instance = MemberController();
  final StreamController<MemberDto> streamController =
      StreamController<MemberDto>.broadcast();
  String? identifier;
  MemberDto? member;

  Future<void> init({final bool afterDelete = false}) async {
    identifier =
        SharedPreferencesController.instance.getString(
          ConfigPropertyKey.identifier,
        ) ??
        await register();

    try {
      await login();
    } on HttpException catch (e) {
      debugPrint('Failed to login: $e');

      if (!afterDelete) {
        // Move the current identifier to old identifier
        final String? oldIdentifier = identifier;
        await SharedPreferencesController.instance.remove(
          ConfigPropertyKey.identifier,
        );

        await SharedPreferencesController.instance.setString(
          ConfigPropertyKey.oldIdentifier,
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
    final Response response = await HttpRequest.instance.post(
      '/v1/members/register',
    );

    if (response.statusCode != HttpStatus.created) {
      throw const HttpException('Failed to register');
    }

    final String identifier =
        (jsonDecode(utf8.decode(response.bodyBytes))
                as Map<String, dynamic>)['identifier']
            as String;
    await SharedPreferencesController.instance.setString(
      ConfigPropertyKey.identifier,
      identifier,
    );
    Analytics.instance.logSignUp();
    return identifier;
  }

  String get _device {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'android';
      case TargetPlatform.iOS:
        return 'ios';
      case TargetPlatform.macOS:
        return 'macos';
      case TargetPlatform.windows:
        return 'windows';
      case TargetPlatform.linux:
        return 'linux';
      case TargetPlatform.fuchsia:
        return 'fuchsia';
    }
  }

  Future<Response> testLogin(final String identifier) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final Response response = await HttpRequest.instance.post(
      '/v1/members/login',
      headers: <String, String>{
        'X-App-Version': '${packageInfo.version}+${packageInfo.buildNumber}',
        'X-Device': _device,
        'X-Locale': Platform.localeName,
      },
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
        ConfigPropertyKey.identifier,
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
    final Map<String, dynamic> json = await HttpRequest.instance
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
    final Response response = await HttpRequest.instance.postMultipart(
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
    member = member!.copyWith(
      attachmentLastUpdateDateTime: DateTime.now().toIso8601String(),
    );
    streamController.add(member!);
  }

  Future<String> associateEmail(final String email) async {
    final Response response = await HttpRequest.instance.post(
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
    final Response response = await HttpRequest.instance.post(
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
    final Response response = await HttpRequest.instance.post(
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
    final String anime, {
    final bool loadMemberData = true,
  }) async {
    if (member!.followedAnimes.contains(anime)) {
      return;
    }

    final Response response = await HttpRequest.instance.put(
      '/v1/members/animes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followAnime(anime, loadMemberData: loadMemberData);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow anime');
    }

    member!.followedAnimes.add(anime);

    if (loadMemberData) {
      await refresh();
    } else {
      streamController.add(member!);
    }
  }

  Future<void> unfollowAnime(final String anime) async {
    final Response response = await HttpRequest.instance.delete(
      '/v1/members/animes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return unfollowAnime(anime);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to unfollow anime');
    }

    member!.followedAnimes.remove(anime);
    await refresh();
  }

  Future<void> followAllEpisodes(final String anime) async {
    if (!member!.followedAnimes.contains(anime)) {
      await followAnime(anime, loadMemberData: false);
    }

    final Response response = await HttpRequest.instance.put(
      '/v1/members/follow-all-episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
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
    final String anime,
    final String episode, {
    final bool refreshAfterFollow = true,
  }) async {
    if (member!.followedEpisodes.contains(episode)) {
      return;
    }

    if (!member!.followedAnimes.contains(anime)) {
      await followAnime(anime, loadMemberData: false);
    }

    final Response response = await HttpRequest.instance.put(
      '/v1/members/episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': episode}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followEpisode(anime, episode);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow episode');
    }

    member!.followedEpisodes.add(episode);

    if (refreshAfterFollow) {
      await refresh();
    }
  }

  Future<void> unfollowEpisode(final String episode) async {
    final Response response = await HttpRequest.instance.delete(
      '/v1/members/episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': episode}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return unfollowEpisode(episode);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to unfollow episode');
    }

    member!.followedEpisodes.remove(episode);
    await refresh();
  }
}

class ConflictEmailException implements Exception {
  const ConflictEmailException();
}
