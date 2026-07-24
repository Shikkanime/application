import 'dart:convert';
import 'dart:io';

import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/ui/viewmodels/auth_viewmodel.dart';
import 'package:application/ui/viewmodels/conflict_email_exception.dart';
import 'package:http/http.dart' as http;

class EmailViewModel {
  EmailViewModel({ApiClient? client}) : _client = client ?? const ApiClient();

  static final EmailViewModel instance = EmailViewModel();
  final ApiClient _client;

  Future<String> associateEmail(
    final String email, {
    final bool isRetry = false,
  }) async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/members/associate-email',
      token: AuthViewModel.instance.member!.token,
      body: email,
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await AuthViewModel.instance.login();
        return associateEmail(email, isRetry: true);

      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.conflict:
        throw const ConflictEmailException();

      case ApiSuccess<http.Response>(:final data):
        return _extractUuid(data);

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<String> forgotIdentifier(
    final String email, {
    final bool isRetry = false,
  }) async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/members/forgot-identifier',
      token: AuthViewModel.instance.member!.token,
      body: email,
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await AuthViewModel.instance.login();
        return forgotIdentifier(email, isRetry: true);

      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.conflict:
        throw const ConflictEmailException();

      case ApiSuccess<http.Response>(:final data):
        return _extractUuid(data);

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  Future<void> validateAction(
    final String uuid,
    final String code, {
    final bool isRetry = false,
  }) async {
    final ApiResult<http.Response> result = await _client.post(
      '/v1/member-actions/validate?uuid=$uuid',
      token: AuthViewModel.instance.member!.token,
      body: code,
    );

    switch (result) {
      case ApiFailure<http.Response>(:final statusCode)
          when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await AuthViewModel.instance.login();
        return validateAction(uuid, code, isRetry: true);

      case ApiSuccess<http.Response>():
        return;

      case ApiFailure<http.Response>(:final error):
        throw HttpException(error);
    }
  }

  String _extractUuid(final http.Response response) {
    return (jsonDecode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>)['uuid']
        as String;
  }
}
