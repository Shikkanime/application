import 'dart:convert';

import 'package:application/core/config/env_config.dart';
import 'package:application/core/logger/app_logger.dart';
import 'package:application/core/network/api_result.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  const HttpClient({this.timeout = const Duration(seconds: 10)});

  final Duration timeout;

  Uri _buildUri(String endpoint, [Map<String, Object>? queryParameters]) {
    final baseUri = Uri.parse('${EnvConfig.apiBaseUrl}/$endpoint');

    if (queryParameters != null && queryParameters.isNotEmpty) {
      return baseUri.replace(
        queryParameters: queryParameters.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
    }

    return baseUri;
  }

  ApiResult<http.Response> _checkStatus(http.Response response) {
    final statusCode = response.statusCode;

    if (!(statusCode >= 200 && statusCode < 300)) {
      return ApiFailure(response.reasonPhrase, statusCode);
    }

    return ApiSuccess(response);
  }

  Future<ApiResult<http.Response>> _execute(
    Future<http.Response> Function() request,
  ) async {
    final stopWatch = Stopwatch()..start();

    try {
      final response = await request().timeout(timeout);
      stopWatch.stop();
      AppLogger.print(
        'Request to ${response.request?.url} took ${stopWatch.elapsedMilliseconds} ms',
      );
      return _checkStatus(response);
    } on Exception catch (e) {
      stopWatch.stop();
      AppLogger.print(
        'Request failed after ${stopWatch.elapsedMilliseconds} ms',
      );
      return ApiFailure(e.toString());
    }
  }

  ApiResult<T> _parseJson<T>(http.Response response) {
    try {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));

      if (decoded is! T) {
        return ApiFailure(
          'Invalid response type: expected $T, got ${decoded.runtimeType}',
        );
      }

      return ApiSuccess(decoded);
    } on FormatException catch (e) {
      return ApiFailure('Invalid JSON: ${e.message}');
    }
  }

  Future<ApiResult<T>> get<T>(
    String endpoint, {
    Map<String, Object>? queryParameters,
  }) async {
    final uri = _buildUri(endpoint, queryParameters);
    final response = await _execute(() => http.get(uri));

    return switch (response) {
      ApiSuccess(:final data) => _parseJson(data),
      ApiFailure failure => ApiFailure(failure.error, failure.statusCode),
    };
  }
}
