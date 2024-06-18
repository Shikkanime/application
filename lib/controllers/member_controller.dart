import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
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

    if (response.statusCode != 201) {
      throw const HttpException('Failed to register');
    }

    final String identifier =
        jsonDecode(utf8.decode(response.bodyBytes))['identifier'];
    await _sharedPreferences.setString('identifier', identifier);
    return identifier;
  }

  Future<Response> testLogin(String identifier) async {
    final response =
        await HttpRequest().post('/v1/members/login', body: identifier);

    if (response.statusCode == 404) {
      throw const HttpException('Failed to login, identifier not found');
    }

    if (response.statusCode != 200) {
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
  }

  Future<void> changeImage() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      final path = result.files.single.path!;

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        uiSettings: [
          AndroidUiSettings(),
          IOSUiSettings(),
        ],
      );

      final response = await HttpRequest().postMultipart(
        '/v1/members/image',
        member!.token,
        croppedFile!.path,
      );

      if (response.statusCode != 200) {
        throw HttpException('Failed to change image ${response.body}');
      }

      imageVersion++;
      await _sharedPreferences.setInt('imageVersion', imageVersion);
      Future.delayed(const Duration(seconds: 1), () {
        streamController.add(member!);
      });
    }
  }

  Future<String> associateEmail(String email) async {
    final response = await HttpRequest().post(
      '/v1/members/associate-email',
      token: member!.token,
      body: email,
    );

    if (response.statusCode == 409) {
      throw const ConflictEmailException();
    }

    if (response.statusCode != 201) {
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

    if (response.statusCode != 200) {
      throw const HttpException('Failed to validate action');
    }

    await login();
  }

  Future<void> followAnime(AnimeDto anime) async {
    final response = await HttpRequest().put(
      '/v1/members/animes',
      member!.token,
      jsonEncode({'uuid': anime.uuid}),
    );

    if (response.statusCode != 200) {
      throw const HttpException('Failed to follow anime');
    }

    member!.followedAnimes.add(anime.uuid);
    streamController.add(member!);
  }

  Future<void> unfollowAnime(AnimeDto anime) async {
    final response = await HttpRequest().delete(
      '/v1/members/animes',
      member!.token,
      jsonEncode({'uuid': anime.uuid}),
    );

    if (response.statusCode != 200) {
      throw const HttpException('Failed to unfollow anime');
    }

    member!.followedAnimes.remove(anime.uuid);
    streamController.add(member!);
  }

  Future<void> followAllEpisodes(AnimeDto anime) async {
    if (!member!.followedAnimes.contains(anime.uuid)) {
      await followAnime(anime);
    }

    final response = await HttpRequest().put(
      '/v1/members/follow-all-episodes',
      member!.token,
      jsonEncode({'uuid': anime.uuid}),
    );

    if (response.statusCode != 200) {
      throw const HttpException('Failed to follow all episodes');
    }

    final json =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final data = List<String>.from(json['data'] as List);
    final duration = json['duration'] as int;

    member!.followedEpisodes.addAll(data);
    member = member!.copyWith(totalDuration: member!.totalDuration + duration);
    streamController.add(member!);
  }

  Future<void> followEpisode(EpisodeMappingDto episode) async {
    if (!member!.followedAnimes.contains(episode.anime.uuid)) {
      await followAnime(episode.anime);
    }

    final response = await HttpRequest().put(
      '/v1/members/episodes',
      member!.token,
      jsonEncode({'uuid': episode.uuid}),
    );

    if (response.statusCode != 200) {
      throw const HttpException('Failed to follow episode');
    }

    member!.followedEpisodes.add(episode.uuid);
    member = member!
        .copyWith(totalDuration: member!.totalDuration + episode.duration);
    streamController.add(member!);
  }

  Future<void> unfollowEpisode(EpisodeMappingDto episode) async {
    final response = await HttpRequest().delete(
      '/v1/members/episodes',
      member!.token,
      jsonEncode({'uuid': episode.uuid}),
    );

    if (response.statusCode != 200) {
      throw const HttpException('Failed to unfollow episode');
    }

    member!.followedEpisodes.remove(episode.uuid);
    member = member!
        .copyWith(totalDuration: member!.totalDuration - episode.duration);
    streamController.add(member!);
  }

  String buildTotalDuration() {
    final duration = Duration(seconds: member!.totalDuration);
    // Build string like '1d 2h 3m 4s'
    // If a value is 0, it is not included
    final parts = <String>[];

    if (duration.inDays > 0) {
      parts.add('${duration.inDays}j');
    }

    if (duration.inHours > 0) {
      parts.add('${duration.inHours % 24}h');
    }

    if (duration.inMinutes > 0) {
      parts.add('${duration.inMinutes % 60}m');
    }

    parts.add('${duration.inSeconds % 60}s');
    return parts.join(' ');
  }
}

class ConflictEmailException implements Exception {
  const ConflictEmailException();
}
