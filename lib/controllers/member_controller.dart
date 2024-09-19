import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/views/crop_view.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberController {
  static MemberController instance = MemberController();
  late final SharedPreferences _sharedPreferences;
  final streamController = StreamController<MemberDto>.broadcast();
  String? identifier;
  MemberDto? member;
  int imageVersion = 0;

  Future<void> init({bool afterDelete = false}) async {
    if (!afterDelete) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    identifier = _sharedPreferences.getString('identifier') ?? await register();
    imageVersion = _sharedPreferences.getInt('imageVersion') ?? 0;

    try {
      await login();
    } on HttpException catch (e) {
      debugPrint('Failed to login: $e');

      if (!afterDelete) {
        // Move the current identifier to old identifier
        final oldIdentifier = identifier;
        await _sharedPreferences.remove('identifier');
        await _sharedPreferences.remove('imageVersion');

        await _sharedPreferences.setString('oldIdentifier', oldIdentifier!);
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
    final response = await HttpRequest().post('/v1/members/register');

    if (response.statusCode != HttpStatus.created) {
      throw const HttpException('Failed to register');
    }

    final String identifier =
        jsonDecode(utf8.decode(response.bodyBytes))['identifier'];
    await _sharedPreferences.setString('identifier', identifier);
    Analytics.instance.logSignUp();
    return identifier;
  }

  Future<Response> testLogin(String identifier) async {
    final response =
        await HttpRequest().post('/v1/members/login', body: identifier);

    if (response.statusCode == HttpStatus.notFound) {
      throw const HttpException('Failed to login, identifier not found');
    }

    if (response.statusCode != HttpStatus.ok) {
      throw ClientException('Server error');
    }

    return response;
  }

  Future<void> login({String? identifier}) async {
    final response = await testLogin(identifier ?? this.identifier!);
    final json = jsonDecode(utf8.decode(response.bodyBytes));

    if (identifier != null) {
      this.identifier = identifier;
      await _sharedPreferences.setString('identifier', identifier);
    }

    member = MemberDto.fromJson(json);
    streamController.add(member!);
    Analytics.instance.logLogin();
  }

  Future<void> changeImage(BuildContext context) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    final bytes = await result?.readAsBytes();

    if (result == null || bytes == null || !context.mounted) {
      return;
    }

    const allowedFormats = ['jpeg', 'png', 'jpg'];

    // Check if the image format is allowed
    if (!allowedFormats.contains(result.path.split('.').last)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.invalidImageFormat),
            content: Text(AppLocalizations.of(context)!.invalidImageExtension),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.ok),
              ),
            ],
          );
        },
      );

      return;
    }

    final controller = CropController();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CropView(
          bytes: bytes,
          controller: controller,
        ),
      ),
    );
  }

  Future<void> updateImage(Uint8List image) async {
    final response = await HttpRequest().postMultipart(
      '/v1/members/image',
      member!.token,
      image,
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return updateImage(image);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Failed to change image ${response.body}',
      );
    }

    await increaseImageVersion();
  }

  Future<void> increaseImageVersion() async {
    imageVersion++;
    await _sharedPreferences.setInt('imageVersion', imageVersion);

    Future.delayed(const Duration(seconds: 1), () {
      streamController.add(member!);
    });
  }

  Future<String> associateEmail(String email) async {
    final response = await HttpRequest().post(
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

    return jsonDecode(utf8.decode(response.bodyBytes))['uuid'] as String;
  }

  Future<String> forgotIdentifier(String email) async {
    final response = await HttpRequest().post(
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

    return jsonDecode(utf8.decode(response.bodyBytes))['uuid'] as String;
  }

  Future<void> validateAction(String uuid, String code) async {
    final response = await HttpRequest().post(
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

  Future<void> followAnime(AnimeDto anime, {bool loadMemberData = true}) async {
    final response = await HttpRequest().put(
      '/v1/members/animes',
      member!.token,
      jsonEncode({'uuid': anime.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followAnime(anime, loadMemberData: loadMemberData);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow anime');
    }

    member!.followedAnimes.add(anime.uuid);
    streamController.add(member!);

    if (loadMemberData) {
      await Future.wait([
        MissedAnimeController.instance.init(),
        FollowedAnimeController.instance.init(),
      ]);
    }
  }

  Future<void> unfollowAnime(AnimeDto anime) async {
    final response = await HttpRequest().delete(
      '/v1/members/animes',
      member!.token,
      jsonEncode({'uuid': anime.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return unfollowAnime(anime);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to unfollow anime');
    }

    member!.followedAnimes.remove(anime.uuid);
    streamController.add(member!);

    await Future.wait([
      MissedAnimeController.instance.init(),
      FollowedAnimeController.instance.init(),
    ]);
  }

  Future<void> followAllEpisodes(AnimeDto anime) async {
    if (!member!.followedAnimes.contains(anime.uuid)) {
      await followAnime(anime, loadMemberData: false);
    }

    final response = await HttpRequest().put(
      '/v1/members/follow-all-episodes',
      member!.token,
      jsonEncode({'uuid': anime.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followAllEpisodes(anime);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow all episodes');
    }

    final json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final data = List<String>.from(json['data'] as List);
    final duration = json['duration'] as int;

    member!.followedEpisodes.addAll(data);
    member = member!.copyWith(totalDuration: member!.totalDuration + duration);
    streamController.add(member!);

    await Future.wait([
      MissedAnimeController.instance.init(),
      FollowedAnimeController.instance.init(),
      FollowedEpisodeController.instance.init(),
    ]);
  }

  Future<void> followEpisode(
    AnimeDto? animeDto,
    EpisodeMappingDto episode,
  ) async {
    final anime = animeDto ?? episode.anime;

    if (anime == null) {
      return;
    }

    if (!member!.followedAnimes.contains(anime.uuid)) {
      await followAnime(anime, loadMemberData: false);
    }

    final response = await HttpRequest().put(
      '/v1/members/episodes',
      member!.token,
      jsonEncode({'uuid': episode.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return followEpisode(animeDto, episode);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to follow episode');
    }

    member!.followedEpisodes.add(episode.uuid);
    member = member!
        .copyWith(totalDuration: member!.totalDuration + episode.duration);
    streamController.add(member!);

    await Future.wait([
      MissedAnimeController.instance.init(),
      FollowedAnimeController.instance.init(),
      FollowedEpisodeController.instance.init(),
    ]);
  }

  Future<void> unfollowEpisode(EpisodeMappingDto episode) async {
    final response = await HttpRequest().delete(
      '/v1/members/episodes',
      member!.token,
      jsonEncode({'uuid': episode.uuid}),
    );

    if (response.statusCode == HttpStatus.unauthorized) {
      await login();
      return unfollowEpisode(episode);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Failed to unfollow episode');
    }

    member!.followedEpisodes.remove(episode.uuid);
    member = member!
        .copyWith(totalDuration: member!.totalDuration - episode.duration);
    streamController.add(member!);

    await Future.wait([
      MissedAnimeController.instance.init(),
      FollowedEpisodeController.instance.init(),
    ]);
  }
}

class ConflictEmailException implements Exception {
  const ConflictEmailException();
}
