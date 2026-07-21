import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:application/core/network/api_result.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/core/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// Centralized HTTP client for the Shikkanime API.
///
/// All HTTP calls go through this class. It handles base URL resolution,
/// authentication header injection, error mapping to [ApiResult], and
/// timeout management.
///
/// Inject this class via `provider` rather than using the singleton pattern.
///
/// {@tool snippet}
/// ```dart
/// final client = const ApiClient();
/// final result = await client.get<Map<String, dynamic>>('/v1/members/me');
/// ```
/// {@end-tool}
class ApiClient {
  const ApiClient({this.timeout = const Duration(seconds: 10)});

  /// Request timeout duration. Defaults to 10 seconds.
  final Duration timeout;

  /// Sends a GET request and parses the response body as [T].
  ///
  /// [endpoint] is appended to [Constant.apiUrl]. Optional [query] parameters
  /// are encoded as query string. If [token] is provided, it is sent as a
  /// Bearer token in the Authorization header.
  Future<ApiResult<T>> get<T>(
    final String endpoint, {
    final Map<String, Object>? query,
    final String? token,
  }) async {
    final Uri uri = _buildUri(endpoint, query);
    final Map<String, String> headers = _buildHeaders(token);

    final ApiResult<http.Response> response = await _execute(
      () => http.get(uri, headers: headers),
    );

    return switch (response) {
      ApiSuccess<http.Response>(:final data) => _parseJson<T>(data),
      ApiFailure<http.Response> failure => ApiFailure<T>(
        failure.error,
        failure.statusCode,
      ),
    };
  }

  /// Sends a GET request and parses the response as a [PageableDto].
  ///
  /// Convenience wrapper around [get] for paginated endpoints.
  Future<ApiResult<PageableDto>> getPage(
    final String endpoint, {
    final Map<String, Object>? query,
    final String? token,
  }) async {
    final ApiResult<Map<String, dynamic>> result =
        await get<Map<String, dynamic>>(endpoint, query: query, token: token);

    return switch (result) {
      ApiSuccess<Map<String, dynamic>>(:final data) => ApiSuccess<PageableDto>(
        PageableDto.fromJson(data),
      ),
      ApiFailure<Map<String, dynamic>> failure => ApiFailure<PageableDto>(
        failure.error,
        failure.statusCode,
      ),
    };
  }

  /// Sends a POST request with an optional JSON [body].
  ///
  /// The request is sent with Content-Type: application/json. If [token] is
  /// provided, it is included as a Bearer token. Additional [headers] are
  /// merged into the request.
  Future<ApiResult<http.Response>> post(
    final String endpoint, {
    final String? token,
    final Map<String, String>? headers,
    final Object? body,
  }) async {
    final Map<String, String> requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      ...?headers,
    };

    return _execute(
      () => http.post(_buildUri(endpoint), headers: requestHeaders, body: body),
    );
  }

  /// Sends a POST request with a single file as multipart/form-data.
  ///
  /// The [bytes] are sent as a file field named 'file'. Requires a [token]
  /// for authentication.
  Future<ApiResult<http.Response>> postMultipart(
    final String endpoint,
    final String token,
    final Uint8List bytes,
  ) async {
    final http.MultipartRequest request = http.MultipartRequest(
      'POST',
      _buildUri(endpoint),
    );

    request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    request.files.add(
      http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'),
    );

    return _executeStreamed(request);
  }

  /// Sends a PUT request with a JSON [body].
  ///
  /// Requires a [token] for authentication.
  Future<ApiResult<http.Response>> put(
    final String endpoint,
    final String token,
    final Object body,
  ) async {
    return _execute(
      () => http.put(
        _buildUri(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      ),
    );
  }

  /// Sends a DELETE request with a JSON [body].
  ///
  /// Requires a [token] for authentication.
  Future<ApiResult<http.Response>> delete(
    final String endpoint,
    final String token,
    final Object body,
  ) async {
    return _execute(
      () => http.delete(
        _buildUri(endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      ),
    );
  }

  /// Opens a URL in an external browser or application.
  ///
  /// Tries multiple launch modes (external non-browser app, external app,
  /// platform default) and returns true if any succeeded.
  Future<bool> launchUrlString(final String url) async {
    final List<LaunchMode> modes = <LaunchMode>[
      LaunchMode.externalNonBrowserApplication,
      LaunchMode.externalApplication,
      LaunchMode.platformDefault,
    ];

    debugPrint('Launch url...');

    for (final LaunchMode mode in modes) {
      try {
        if (await launchUrl(Uri.parse(url), mode: mode)) {
          return true;
        }
      } on PlatformException catch (e) {
        debugPrint('Failed to launch URL with mode $mode: $e');
      }
    }

    return false;
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  /// Builds a URI by appending [endpoint] to [Constant.apiUrl] and encoding
  /// optional [query] parameters.
  Uri _buildUri(final String endpoint, [final Map<String, Object>? query]) {
    final Uri baseUri = Uri.parse(Constant.apiUrl + endpoint);

    if (query == null || query.isEmpty) {
      return baseUri;
    }

    return baseUri.replace(
      queryParameters: query.map(
        (final String key, final Object value) =>
            MapEntry<String, String>(key, value.toString()),
      ),
    );
  }

  /// Builds default headers, optionally including a Bearer [token].
  Map<String, String> _buildHeaders(final String? token) => <String, String>{
    if (token != null) 'Authorization': 'Bearer $token',
  };

  /// Checks [response] status code and returns [ApiResult].
  ///
  /// Returns [ApiSuccess] for 200 and 201, [ApiFailure] otherwise.
  ApiResult<http.Response> _checkStatus(final http.Response response) {
    if (response.statusCode == HttpStatus.unauthorized) {
      return const ApiFailure<http.Response>('Unauthorized', 401);
    }

    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      return ApiFailure<http.Response>('Request failed', response.statusCode);
    }

    return ApiSuccess<http.Response>(response);
  }

  /// Maps a caught [error] to an [ApiFailure] with a user-friendly message.
  ApiResult<http.Response> _catchToResult(final Object error) =>
      switch (error) {
        SocketException e => ApiFailure<http.Response>(
          'Network error: ${e.message}',
        ),
        http.ClientException e => ApiFailure<http.Response>(
          'Client error: ${e.message}',
        ),
        TimeoutException _ => const ApiFailure<http.Response>(
          'Request timed out',
        ),
        _ => ApiFailure<http.Response>('Request error: $error'),
      };

  /// Executes a plain HTTP request and wraps the result in [ApiResult].
  ///
  /// Handles common error types: [SocketException], [ClientException],
  /// and [TimeoutException].
  Future<ApiResult<http.Response>> _execute(
    final Future<http.Response> Function() request,
  ) async {
    try {
      final http.Response response = await request().timeout(timeout);
      return _checkStatus(response);
    } on Object catch (e) {
      return _catchToResult(e);
    }
  }

  /// Executes a streamed (multipart) request and wraps the result in [ApiResult].
  Future<ApiResult<http.Response>> _executeStreamed(
    final http.MultipartRequest request,
  ) async {
    try {
      final http.StreamedResponse streamedResponse = await request
          .send()
          .timeout(timeout);
      final http.Response response = await http.Response.fromStream(
        streamedResponse,
      );
      return _checkStatus(response);
    } on Object catch (e) {
      return _catchToResult(e);
    }
  }

  /// Decodes the response body as UTF-8 JSON and casts it to [T].
  ///
  /// Returns [ApiFailure] if the body cannot be parsed.
  ApiResult<T> _parseJson<T>(final http.Response response) {
    try {
      final dynamic decoded = jsonDecode(utf8.decode(response.bodyBytes));
      return ApiSuccess<T>(decoded as T);
    } on FormatException catch (e) {
      return ApiFailure<T>('Invalid JSON: ${e.message}');
    }
  }
}
