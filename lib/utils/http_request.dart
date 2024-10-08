import 'dart:convert';
import 'dart:io';

import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static final instance = HttpRequest();
  static const _timeout = Duration(seconds: 10);

  Future<T> get<T>(String endpoint, {String? token}) async {
    final headers = <String, String>{};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final response = await http
        .get(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
        )
        .timeout(_timeout);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load data');
    }

    return jsonDecode(utf8.decode(response.bodyBytes)) as T;
  }

  Future<PageableDto> getPage(
    String endpoint, {
    String? token,
  }) async {
    return PageableDto.fromJson(
      await get<Map<String, dynamic>>(endpoint, token: token),
    );
  }

  Future<http.Response> post<Response>(
    String endpoint, {
    String? token,
    Object? body,
  }) async {
    final headers = <String, String>{};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http
        .post(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
          body: body,
        )
        .timeout(_timeout);
  }

  Future<http.Response> postMultipart<Response>(
    String endpoint,
    String token,
    Uint8List bytes,
  ) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(
        Constant.apiUrl + endpoint,
      ),
    );

    request.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: 'image.jpg',
      ),
    );

    return http.Response.fromStream(await request.send()).timeout(_timeout);
  }

  Future<http.Response> put<Response>(
    String endpoint,
    String token,
    Object body,
  ) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await http
        .put(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
          body: body,
        )
        .timeout(_timeout);
  }

  Future<http.Response> delete<Response>(
    String endpoint,
    String token,
    Object body,
  ) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await http
        .delete(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
          body: body,
        )
        .timeout(_timeout);
  }
}
