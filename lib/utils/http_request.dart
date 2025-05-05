import 'dart:convert';
import 'dart:io';

import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static final HttpRequest instance = HttpRequest();
  static const Duration _timeout = Duration(seconds: 10);

  Future<T> get<T>(
    final String endpoint, {
    final String? token,
    final VoidCallback? onUnauthorized,
  }) async {
    final Map<String, String> headers = <String, String>{
      if (token != null) 'Authorization': 'Bearer $token',
    };

    final http.Response response = await http
        .get(Uri.parse(Constant.apiUrl + endpoint), headers: headers)
        .timeout(_timeout);

    if (response.statusCode == HttpStatus.unauthorized) {
      onUnauthorized?.call();

      return Future<T>.error(
        PlatformException(code: '401', message: 'Unauthorized'),
      );
    }

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load data');
    }

    return jsonDecode(utf8.decode(response.bodyBytes)) as T;
  }

  Future<PageableDto> getPage(
    final String endpoint, {
    final String? token,
    final VoidCallback? onUnauthorized,
  }) async => PageableDto.fromJson(
    await get<Map<String, dynamic>>(
      endpoint,
      token: token,
      onUnauthorized: onUnauthorized,
    ),
  );

  Future<http.Response> post<Response>(
    final String endpoint, {
    final String? token,
    final Map<String, String>? headers,
    final Object? body,
  }) async {
    final Map<String, String> requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      if (headers != null) ...headers,
    };

    return http
        .post(
          Uri.parse(Constant.apiUrl + endpoint),
          headers: requestHeaders,
          body: body,
        )
        .timeout(_timeout);
  }

  Future<http.Response> postMultipart<Response>(
    final String endpoint,
    final String token,
    final Uint8List bytes,
  ) async {
    final http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse(Constant.apiUrl + endpoint),
    );

    request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    request.files.add(
      http.MultipartFile.fromBytes('file', bytes, filename: 'image.jpg'),
    );

    return http.Response.fromStream(await request.send()).timeout(_timeout);
  }

  Future<http.Response> put<Response>(
    final String endpoint,
    final String token,
    final Object body,
  ) async => http
      .put(
        Uri.parse(Constant.apiUrl + endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      )
      .timeout(_timeout);

  Future<http.Response> delete<Response>(
    final String endpoint,
    final String token,
    final Object body,
  ) async => http
      .delete(
        Uri.parse(Constant.apiUrl + endpoint),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      )
      .timeout(_timeout);
}
