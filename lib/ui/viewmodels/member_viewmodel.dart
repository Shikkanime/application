import 'dart:async';
import 'dart:io';

import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/data/models/anime_dto.dart';
import 'package:application/data/models/episode_mapping_dto.dart';
import 'package:application/data/models/missed_anime_dto.dart';
import 'package:application/data/models/refresh_member_dto.dart';
import 'package:application/ui/viewmodels/animes/followed_anime_controller.dart';
import 'package:application/ui/viewmodels/animes/missed_anime_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/ui/viewmodels/auth_viewmodel.dart';
import 'package:application/ui/viewmodels/episodes/followed_episode_controller.dart';
import 'package:application/ui/views/crop_view.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

/// Holds the member state and handles refresh, image upload, and image
/// picking operations.
class MemberViewModel {
  MemberViewModel({ApiClient? client}) : _client = client ?? const ApiClient();

  static final MemberViewModel instance = MemberViewModel();
  final ApiClient _client;
  bool isImageUploadLoading = false;

  /// Refreshes member data from the server.
  Future<void> refresh({final bool isRetry = false}) async {
    final auth = AuthViewModel.instance;
    final result = await _client.get<Map<String, dynamic>>(
      '/v1/members/refresh',
      token: auth.member!.token,
    );

    switch (result) {
      case ApiFailure<Map<String, dynamic>>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          debugPrint('Failed to refresh member data: Unauthorized after retry');
          return;
        }
        await auth.login();
        return refresh(isRetry: true);

      case ApiSuccess<Map<String, dynamic>>(:final data):
        final refreshedMember = RefreshMemberDto.fromJson(data);
        auth.member = auth.member!.copyWith(
          totalDuration: refreshedMember.totalDuration,
          totalUnseenDuration: refreshedMember.totalUnseenDuration,
        );
        final missedAnimes = refreshedMember.missedAnimes.data
            .map(
              (final e) => MissedAnimeDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        final followedAnimes = refreshedMember.followedAnimes.data
            .map((final e) => AnimeDto.fromJson(e as Map<String, dynamic>))
            .toList();
        final followedEpisodes = refreshedMember.followedEpisodes.data
            .map(
              (final e) =>
                  EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
            )
            .toList();

        auth.streamController.add(auth.member!);
        MissedAnimeController.instance.setItems(missedAnimes);
        FollowedAnimeController.instance.setItems(followedAnimes);
        FollowedEpisodeController.instance.setItems(followedEpisodes);

      case ApiFailure<Map<String, dynamic>>(:final error):
        debugPrint('Failed to refresh member data: $error');
    }
  }

  /// Opens the gallery to pick an image, validates format, and navigates
  /// to [CropView] for cropping.
  Future<void> changeImage(final BuildContext context) async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);
    final bytes = await result?.readAsBytes();

    if (result == null || bytes == null || !context.mounted) {
      return;
    }

    const allowedFormats = <String>['jpeg', 'png', 'jpg'];
    if (!allowedFormats.contains(result.path.split('.').last)) {
      await showDialog(
        context: context,
        builder: (final context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.invalidImageFormat),
          content: Text(AppLocalizations.of(context)!.invalidImageExtension),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        ),
      );
      return;
    }

    final controller = CropController();
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (final context) =>
            CropView(bytes: bytes, controller: controller),
      ),
    );
  }

  /// Uploads the cropped image bytes to the server.
  Future<void> updateImage(
    final Uint8List image, {
    final bool isRetry = false,
  }) async {
    final auth = AuthViewModel.instance;
    isImageUploadLoading = true;
    auth.streamController.add(auth.member!);

    final result = await _client.postMultipart(
      '/v1/members/image',
      auth.member!.token,
      image,
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await auth.login();
        return updateImage(image, isRetry: true);

      case ApiSuccess<http.Response>():
        isImageUploadLoading = false;
        auth.member = auth.member!.copyWith(
          attachmentLastUpdateDateTime: DateTime.now().toIso8601String(),
        );
        auth.streamController.add(auth.member!);

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }
}
