import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:application/core/analytics/analytics.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/data/models/enums/config_property_key.dart';
import 'package:application/data/models/member_dto.dart';
import 'package:application/ui/viewmodels/shared_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

class AuthViewModel {
  AuthViewModel({ApiClient? client, Analytics? analytics})
    : _client = client ?? const ApiClient(),
      _analytics = analytics ?? const Analytics();
  static AuthViewModel instance = AuthViewModel();
  final ApiClient _client;
  final Analytics _analytics;
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
      ApiSuccess<http.Response>(:final data) => await _handleRegisterSuccess(
        data,
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

  Future<http.Response> testLogin(final String identifier) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final ApiResult<http.Response> result = await _client.post(
      '/v1/members/login',
      headers: <String, String>{
        'X-App-Version': '${packageInfo.version}+${packageInfo.buildNumber}',
        'X-Device': _device,
        'X-Locale': Platform.localeName,
      },
      body: identifier,
    );

    return switch (result) {
      ApiSuccess<http.Response>(:final data) => data,
      ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.notFound =>
        throw const HttpException('Failed to login, identifier not found'),
      ApiFailure<http.Response>(:final error) => throw http.ClientException(
        error,
      ),
    };
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
  }
}
