import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:application/ui/viewmodels/animes/followed_anime_controller.dart';
import 'package:application/ui/viewmodels/animes/missed_anime_controller.dart';
import 'package:application/ui/viewmodels/episodes/followed_episode_controller.dart';
import 'package:application/ui/viewmodels/shared_preferences_controller.dart';
import 'package:application/data/models/anime_dto.dart';
import 'package:application/data/models/enums/config_property_key.dart';
import 'package:application/data/models/episode_mapping_dto.dart';
import 'package:application/data/models/member_dto.dart';
import 'package:application/data/models/missed_anime_dto.dart';
import 'package:application/data/models/refresh_member_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/core/analytics/analytics.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/ui/views/crop_view.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MemberController {
  MemberController({ApiClient? client, Analytics? analytics})
    : _client = client ?? const ApiClient(),
      _analytics = analytics ?? const Analytics();
  static MemberController instance = MemberController();
  final ApiClient _client;
  final Analytics _analytics;
  bool _isRetry = false;
  final StreamController<MemberDto> streamController =
      StreamController<MemberDto>.broadcast();
  String? identifier;
  MemberDto? member;
  bool isImageUploadLoading = false;

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
    } on http.ClientException catch (e) {
      debugPrint('Failed to login: $e');
      rethrow;
    }
  }

  Future<String> register() async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/members/register',
    );

    return switch (result) {
      ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.created =>
        await _handleRegisterSuccess(data),
      ApiSuccess<http.Response>(:final data) => throw HttpException(
        'Failed to register: ${data.statusCode}',
      ),
      ApiFailure<http.Response>(:final error) => throw HttpException(error),
    };
  }

  Future<String> _handleRegisterSuccess(final http.Response response) async {
    final String identifier =
        (jsonDecode(utf8.decode(response.bodyBytes))
                as Map<String, dynamic>)['identifier']
            as String;
    await SharedPreferencesController.instance.setString(
      ConfigPropertyKey.identifier,
      identifier,
    );
    _analytics.logSignUp();
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

  Future<http.Response> _postAndGetResponse(
    final String endpoint, {
    final String? token,
    final Map<String, String>? headers,
    final Object? body,
  }) async {
    final ApiResult<http.Response> result = await _client.post(
      endpoint,
      token: token,
      headers: headers,
      body: body,
    );

    return switch (result) {
      ApiSuccess<http.Response>(:final data) => data,
      ApiFailure<http.Response>(:final error) => throw http.ClientException(
        error,
      ),
    };
  }

  Future<http.Response> testLogin(final String identifier) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final http.Response response = await _postAndGetResponse(
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
      throw http.ClientException('Server error');
    }

    return response;
  }

  Future<void> login({final String? identifier}) async {
    final http.Response response = await testLogin(
      identifier ?? this.identifier!,
    );
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
    _analytics.logLogin();

    if (identifier != null) {
      await refresh();
    }
  }

  Future<void> refresh() async {
    final ApiResult<Map<String, dynamic>> result = await _client
        .get<Map<String, dynamic>>('/v1/members/refresh', token: member!.token);

    switch (result) {
      case ApiSuccess<Map<String, dynamic>>(:final data):
        final RefreshMemberDto refreshedMember = RefreshMemberDto.fromJson(
          data,
        );

        member = member!.copyWith(
          totalDuration: refreshedMember.totalDuration,
          totalUnseenDuration: refreshedMember.totalUnseenDuration,
        );

        final List<MissedAnimeDto> missedAnimes = refreshedMember
            .missedAnimes
            .data
            .map(
              (final dynamic e) =>
                  MissedAnimeDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        final List<AnimeDto> followedAnimes = refreshedMember
            .followedAnimes
            .data
            .map(
              (final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        final List<EpisodeMappingDto> followedEpisodes = refreshedMember
            .followedEpisodes
            .data
            .map(
              (final dynamic e) =>
                  EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        streamController.add(member!);
        MissedAnimeController.instance.setItems(missedAnimes);
        FollowedAnimeController.instance.setItems(followedAnimes);
        FollowedEpisodeController.instance.setItems(followedEpisodes);

      case ApiFailure<Map<String, dynamic>>(:final error):
        debugPrint('Failed to refresh member data: $error');
    }
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
        builder: (final BuildContext context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.invalidImageFormat),
          content: Text(AppLocalizations.of(context)!.invalidImageExtension),
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
        builder: (final BuildContext context) =>
            CropView(bytes: bytes, controller: controller),
      ),
    );
  }

  Future<void> updateImage(final Uint8List image) async {
    isImageUploadLoading = true;
    streamController.add(member!);

    final ApiResult<http.Response> result = await _client.postMultipart(
      '/v1/members/image',
      member!.token,
      image,
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        return updateImage(image);

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        isImageUploadLoading = false;
        member = member!.copyWith(
          attachmentLastUpdateDateTime: DateTime.now().toIso8601String(),
        );
        streamController.add(member!);

      case ApiSuccess<http.Response>(:final data):
        throw HttpException('Failed to change image ${data.body}');

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<String> associateEmail(final String email) async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/members/associate-email',
      token: member!.token,
      body: email,
    );

    return switch (result) {
      ApiFailure<http.Response>(:final statusCode) when statusCode == 401 =>
        _retryAssociateEmail(email),
      ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.conflict =>
        throw const ConflictEmailException(),
      ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.created =>
        _extractUuid(data),
      ApiSuccess<http.Response>(:final data) => throw HttpException(
        'Failed to associate email: ${data.statusCode}',
      ),
      ApiFailure<http.Response>(:final error) => throw HttpException(error),
    };
  }

  Future<String> _retryAssociateEmail(final String email) async {
    if (_isRetry) {
      throw Exception("Unauthorized after retry");
    }
    _isRetry = true;
    await login();
    return associateEmail(email);
  }

  String _extractUuid(final http.Response response) {
    return (jsonDecode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>)['uuid']
        as String;
  }

  Future<String> forgotIdentifier(final String email) async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/members/forgot-identifier',
      token: member!.token,
      body: email,
    );

    return switch (result) {
      ApiFailure<http.Response>(:final statusCode) when statusCode == 401 =>
        _retryForgotIdentifier(email),
      ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.conflict =>
        throw const ConflictEmailException(),
      ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.created =>
        _extractUuid(data),
      ApiSuccess<http.Response>(:final data) => throw HttpException(
        'Failed: ${data.statusCode}',
      ),
      ApiFailure<http.Response>(:final error) => throw HttpException(error),
    };
  }

  Future<String> _retryForgotIdentifier(final String email) async {
    if (_isRetry) {
      throw Exception("Unauthorized after retry");
    }
    _isRetry = true;
    await login();
    return forgotIdentifier(email);
  }

  Future<void> validateAction(final String uuid, final String code) async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/member-actions/validate?uuid=$uuid',
      token: member!.token,
      body: code,
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        return validateAction(uuid, code);

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        return;

      case ApiSuccess<http.Response>(:final data):
        throw HttpException('Failed to validate action: ${data.statusCode}');

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> followAnime(
    final String anime, {
    final bool loadMemberData = true,
  }) async {
    if (member!.followedAnimes.contains(anime)) {
      return;
    }

    final ApiResult<http.Response> result = await _client.put(
      '/v1/members/animes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        return followAnime(anime, loadMemberData: loadMemberData);

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        member!.followedAnimes.add(anime);

        if (loadMemberData) {
          await refresh();
        } else {
          streamController.add(member!);
        }

      case ApiSuccess<http.Response>(:final data):
        throw HttpException('Failed to follow anime: ${data.statusCode}');

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> unfollowAnime(final String anime) async {
    final ApiResult<http.Response> result = await _client.delete(
      '/v1/members/animes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        return unfollowAnime(anime);

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        member!.followedAnimes.remove(anime);
        await refresh();

      case ApiSuccess<http.Response>(:final data):
        throw HttpException('Failed to unfollow anime: ${data.statusCode}');

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> followAllEpisodes(final String anime) async {
    if (!member!.followedAnimes.contains(anime)) {
      await followAnime(anime, loadMemberData: false);
    }

    final ApiResult<http.Response> result = await _client.put(
      '/v1/members/follow-all-episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        await followAllEpisodes(anime); _isRetry = false; return;

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        final Map<String, dynamic> json =
            jsonDecode(utf8.decode(data.bodyBytes)) as Map<String, dynamic>;
        final List<String> newEpisodes = List<String>.from(
          json['data'] as List<dynamic>,
        );
        member!.followedEpisodes.addAll(newEpisodes);
        await refresh();

      case ApiSuccess<http.Response>(:final data):
        throw HttpException(
          'Failed to follow all episodes: ${data.statusCode}',
        );

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
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

    final ApiResult<http.Response> result = await _client.put(
      '/v1/members/episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': episode}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        await followEpisode(anime, episode); _isRetry = false; return;

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        member!.followedEpisodes.add(episode);

        if (refreshAfterFollow) {
          await refresh();
        }

      case ApiSuccess<http.Response>(:final data):
        throw HttpException('Failed to follow episode: ${data.statusCode}');

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> unfollowEpisode(final String episode) async {
    final ApiResult<http.Response> result = await _client.delete(
      '/v1/members/episodes',
      member!.token,
      jsonEncode(<String, String>{'uuid': episode}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode) when statusCode == 401:
        if (_isRetry) {
          throw Exception("Unauthorized after retry");
        }
        _isRetry = true;
        await login();
        await unfollowEpisode(episode); _isRetry = false; return;

      case ApiSuccess<http.Response>(:final data)
          when data.statusCode == HttpStatus.ok:
        member!.followedEpisodes.remove(episode);
        await refresh();

      case ApiSuccess<http.Response>(:final data):
        throw HttpException('Failed to unfollow episode: ${data.statusCode}');

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }
}

class ConflictEmailException implements Exception {
  const ConflictEmailException();
}
