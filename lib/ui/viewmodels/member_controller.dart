import 'dart:async';
import 'dart:typed_data';

import 'package:application/core/analytics/analytics.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/data/models/member_dto.dart';
import 'package:application/ui/viewmodels/auth_viewmodel.dart';
import 'package:application/ui/viewmodels/email_viewmodel.dart';
import 'package:application/ui/viewmodels/follow_viewmodel.dart';
import 'package:application/ui/viewmodels/member_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Facade controller that delegates to dedicated ViewModels.
///
/// Maintains backward compatibility while the app migrates to the
/// individual ViewModels. New code should use the specific ViewModels
/// directly.
class MemberController {
  MemberController({ApiClient? client, Analytics? analytics})
    : _client = client ?? const ApiClient(),
      _analytics = analytics ?? const Analytics();

  static MemberController instance = MemberController();
  // ignore: unused_field — kept for backward-compatible DI constructor
  final ApiClient _client;
  // ignore: unused_field — kept for backward-compatible DI constructor
  final Analytics _analytics;

  StreamController<MemberDto> get streamController =>
      AuthViewModel.instance.streamController;
  String? get identifier => AuthViewModel.instance.identifier;
  set identifier(final String? value) =>
      AuthViewModel.instance.identifier = value;
  MemberDto? get member => AuthViewModel.instance.member;
  set member(final MemberDto? value) => AuthViewModel.instance.member = value;
  bool get isImageUploadLoading =>
      MemberViewModel.instance.isImageUploadLoading;
  set isImageUploadLoading(final bool value) =>
      MemberViewModel.instance.isImageUploadLoading = value;

  Future<void> init({final bool afterDelete = false}) =>
      AuthViewModel.instance.init(afterDelete: afterDelete);
  Future<String> register() => AuthViewModel.instance.register();
  Future<http.Response> testLogin(final String identifier) =>
      AuthViewModel.instance.testLogin(identifier);
  Future<void> login({final String? identifier}) =>
      AuthViewModel.instance.login(identifier: identifier);

  Future<void> refresh({final bool isRetry = false}) =>
      MemberViewModel.instance.refresh(isRetry: isRetry);
  Future<void> changeImage(final BuildContext context) =>
      MemberViewModel.instance.changeImage(context);
  Future<void> updateImage(
    final Uint8List image, {
    final bool isRetry = false,
  }) => MemberViewModel.instance.updateImage(image, isRetry: isRetry);

  Future<String> associateEmail(
    final String email, {
    final bool isRetry = false,
  }) => EmailViewModel.instance.associateEmail(email, isRetry: isRetry);
  Future<String> forgotIdentifier(
    final String email, {
    final bool isRetry = false,
  }) => EmailViewModel.instance.forgotIdentifier(email, isRetry: isRetry);
  Future<void> validateAction(
    final String uuid,
    final String code, {
    final bool isRetry = false,
  }) => EmailViewModel.instance.validateAction(uuid, code, isRetry: isRetry);

  Future<void> followAnime(
    final String anime, {
    final bool loadMemberData = true,
    final bool isRetry = false,
  }) => FollowViewModel.instance.followAnime(
    anime,
    loadMemberData: loadMemberData,
    isRetry: isRetry,
  );
  Future<void> unfollowAnime(
    final String anime, {
    final bool isRetry = false,
  }) => FollowViewModel.instance.unfollowAnime(anime, isRetry: isRetry);
  Future<void> followAllEpisodes(
    final String anime, {
    final bool isRetry = false,
  }) => FollowViewModel.instance.followAllEpisodes(anime, isRetry: isRetry);
  Future<void> followEpisode(
    final String anime,
    final String episode, {
    final bool refreshAfterFollow = true,
    final bool isRetry = false,
  }) => FollowViewModel.instance.followEpisode(
    anime,
    episode,
    refreshAfterFollow: refreshAfterFollow,
    isRetry: isRetry,
  );
  Future<void> unfollowEpisode(
    final String episode, {
    final bool isRetry = false,
  }) => FollowViewModel.instance.unfollowEpisode(episode, isRetry: isRetry);
}
