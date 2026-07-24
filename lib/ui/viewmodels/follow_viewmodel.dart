import 'dart:convert';
import 'dart:io';

import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/ui/viewmodels/auth_viewmodel.dart';
import 'package:application/ui/viewmodels/member_viewmodel.dart';
import 'package:http/http.dart' as http;

/// Handles follow/unfollow operations for animes and episodes.
class FollowViewModel {
  FollowViewModel({ApiClient? client}) : _client = client ?? const ApiClient();

  static final FollowViewModel instance = FollowViewModel();
  final ApiClient _client;

  Future<void> followAnime(
    final String anime, {
    final bool loadMemberData = true,
    final bool isRetry = false,
  }) async {
    final auth = AuthViewModel.instance;
    if (auth.member!.followedAnimes.contains(anime)) {
      return;
    }

    final result = await _client.put(
      '/v1/members/animes',
      auth.member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await auth.login();
        return followAnime(
          anime,
          loadMemberData: loadMemberData,
          isRetry: true,
        );

      case ApiSuccess<http.Response>():
        auth.member!.followedAnimes.add(anime);
        if (loadMemberData) {
          await MemberViewModel.instance.refresh();
        } else {
          auth.streamController.add(auth.member!);
        }

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> unfollowAnime(
    final String anime, {
    final bool isRetry = false,
  }) async {
    final auth = AuthViewModel.instance;
    final result = await _client.delete(
      '/v1/members/animes',
      auth.member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await auth.login();
        return unfollowAnime(anime, isRetry: true);

      case ApiSuccess<http.Response>():
        auth.member!.followedAnimes.remove(anime);
        await MemberViewModel.instance.refresh();

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> followAllEpisodes(
    final String anime, {
    final bool isRetry = false,
  }) async {
    final auth = AuthViewModel.instance;
    if (!auth.member!.followedAnimes.contains(anime)) {
      await followAnime(anime, loadMemberData: false);
    }

    final result = await _client.put(
      '/v1/members/follow-all-episodes',
      auth.member!.token,
      jsonEncode(<String, String>{'uuid': anime}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await auth.login();
        return followAllEpisodes(anime, isRetry: true);

      case ApiSuccess<http.Response>(:final data):
        final json =
            jsonDecode(utf8.decode(data.bodyBytes)) as Map<String, dynamic>;
        final newEpisodes = List<String>.from(json['data'] as List<dynamic>);
        auth.member!.followedEpisodes.addAll(newEpisodes);
        await MemberViewModel.instance.refresh();

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> followEpisode(
    final String anime,
    final String episode, {
    final bool refreshAfterFollow = true,
    final bool isRetry = false,
  }) async {
    final auth = AuthViewModel.instance;
    if (auth.member!.followedEpisodes.contains(episode)) {
      return;
    }

    if (!auth.member!.followedAnimes.contains(anime)) {
      await followAnime(anime, loadMemberData: false);
    }

    final result = await _client.put(
      '/v1/members/episodes',
      auth.member!.token,
      jsonEncode(<String, String>{'uuid': episode}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await auth.login();
        return followEpisode(
          anime,
          episode,
          refreshAfterFollow: refreshAfterFollow,
          isRetry: true,
        );

      case ApiSuccess<http.Response>():
        auth.member!.followedEpisodes.add(episode);
        if (refreshAfterFollow) {
          await MemberViewModel.instance.refresh();
        }

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> unfollowEpisode(
    final String episode, {
    final bool isRetry = false,
  }) async {
    final auth = AuthViewModel.instance;
    final result = await _client.delete(
      '/v1/members/episodes',
      auth.member!.token,
      jsonEncode(<String, String>{'uuid': episode}),
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await auth.login();
        return unfollowEpisode(episode, isRetry: true);

      case ApiSuccess<http.Response>():
        auth.member!.followedEpisodes.remove(episode);
        await MemberViewModel.instance.refresh();

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }
}
