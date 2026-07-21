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
/// All HTTP calls go through this class. It handles:
/// - Base URL configuration
/// - Authentication header injection
/// - Error mapping to [ApiResult]
/// - Timeout management
///
/// Inject this class via `provider` rather than using the singleton pattern.
class ApiClient {
  const ApiClient({Duration? timeout})
    : _timeout = timeout ?? const Duration(seconds: 10);

  final Duration _timeout;

  // ---------------------------------------------------------------------------
  // GET
  // ---------------------------------------------------------------------------

  Future<ApiResult<T>> get<T>(
    final String endpoint, {
    final Map<String, Object>? query,
    final String? token,
  }) async {
    try {
      final Map<String, String> headers = <String, String>{
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final Uri baseUri = Uri.parse(Constant.apiUrl + endpoint);
      final Uri uri = baseUri.replace(
        queryParameters: (query?.isEmpty ?? true)
            ? null
            : query!.map(
                (final String key, final Object value) =>
                    MapEntry<String, String>(key, value.toString()),
              ),
      );

      final http.Response response = await http
          .get(uri, headers: headers)
          .timeout(_timeout);

      if (response.statusCode == HttpStatus.unauthorized) {
        return ApiFailure<T>('Unauthorized', 401);
      }

      if (response.statusCode != HttpStatus.ok) {
        return ApiFailure<T>('Failed to load data', response.statusCode);
      }

      final dynamic decoded = jsonDecode(utf8.decode(response.bodyBytes));
      return ApiSuccess<T>(decoded as T);
    } on SocketException catch (e) {
      return ApiFailure<T>('Network error: ${e.message}');
    } on http.ClientException catch (e) {
      return ApiFailure<T>('Client error: ${e.message}');
    } on FormatException catch (e) {
      return ApiFailure<T>('Invalid response format: ${e.message}');
    } on TimeoutException {
      return ApiFailure<T>('Request timed out');
    }
  }

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

  // ---------------------------------------------------------------------------
  // POST
  // ---------------------------------------------------------------------------

  Future<ApiResult<http.Response>> post(
    final String endpoint, {
    final String? token,
    final Map<String, String>? headers,
    final Object? body,
  }) async {
    try {
      final Map<String, String> requestHeaders = <String, String>{
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers,
      };

      final http.Response response = await http
          .post(
            Uri.parse(Constant.apiUrl + endpoint),
            headers: requestHeaders,
            body: body,
          )
          .timeout(_timeout);

      if (response.statusCode == HttpStatus.unauthorized) {
        return ApiFailure<http.Response>('Unauthorized', 401);
      }

      return ApiSuccess<http.Response>(response);
    } on SocketException catch (e) {
      return ApiFailure<http.Response>('Network error: ${e.message}');
    } on http.ClientException catch (e) {
      return ApiFailure<http.Response>('Client error: ${e.message}');
    } on TimeoutException {
      return ApiFailure<http.Response>('Request timed out');
    }
  }

  Future<ApiResult<http.Response>> postMultipart(
    final String endpoint,
    final String token,
    final Uint8List bytes,
  ) async {
    try {
      final http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(Constant.apiUrl + endpoint),
      );

      request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'),
      );

      final http.StreamedResponse streamedResponse = await request
          .send()
          .timeout(_timeout);
      final http.Response response = await http.Response.fromStream(
        streamedResponse,
      );

      if (response.statusCode == HttpStatus.unauthorized) {
        return ApiFailure<http.Response>('Unauthorized', 401);
      }

      return ApiSuccess<http.Response>(response);
    } on SocketException catch (e) {
      return ApiFailure<http.Response>('Network error: ${e.message}');
    } on http.ClientException catch (e) {
      return ApiFailure<http.Response>('Client error: ${e.message}');
    } on TimeoutException {
      return ApiFailure<http.Response>('Request timed out');
    }
  }

  // ---------------------------------------------------------------------------
  // PUT
  // ---------------------------------------------------------------------------

  Future<ApiResult<http.Response>> put(
    final String endpoint,
    final String token,
    final Object body,
  ) async {
    try {
      final http.Response response = await http
          .put(
            Uri.parse(Constant.apiUrl + endpoint),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: body,
          )
          .timeout(_timeout);

      if (response.statusCode == HttpStatus.unauthorized) {
        return ApiFailure<http.Response>('Unauthorized', 401);
      }

      return ApiSuccess<http.Response>(response);
    } on SocketException catch (e) {
      return ApiFailure<http.Response>('Network error: ${e.message}');
    } on http.ClientException catch (e) {
      return ApiFailure<http.Response>('Client error: ${e.message}');
    } on TimeoutException {
      return ApiFailure<http.Response>('Request timed out');
    }
  }

  // ---------------------------------------------------------------------------
  // DELETE
  // ---------------------------------------------------------------------------

  Future<ApiResult<http.Response>> delete(
    final String endpoint,
    final String token,
    final Object body,
  ) async {
    try {
      final http.Response response = await http
          .delete(
            Uri.parse(Constant.apiUrl + endpoint),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: body,
          )
          .timeout(_timeout);

      if (response.statusCode == HttpStatus.unauthorized) {
        return ApiFailure<http.Response>('Unauthorized', 401);
      }

      return ApiSuccess<http.Response>(response);
    } on SocketException catch (e) {
      return ApiFailure<http.Response>('Network error: ${e.message}');
    } on http.ClientException catch (e) {
      return ApiFailure<http.Response>('Client error: ${e.message}');
    } on TimeoutException {
      return ApiFailure<http.Response>('Request timed out');
    }
  }

  // ---------------------------------------------------------------------------
  // URL launcher (not HTTP, but kept here for convenience)
  // ---------------------------------------------------------------------------

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
}
