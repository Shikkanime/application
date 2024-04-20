import 'dart:convert';

import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static final instance = HttpRequest();
  static const _timeout = Duration(seconds: 5);

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

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    return jsonDecode(utf8.decode(response.bodyBytes)) as T;
  }

  Future<PageableDto> getPage(String endpoint) async {
    return PageableDto.fromJson(await get<Map<String, dynamic>>(endpoint));
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

    final response = await http
        .post(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
          body: body,
        )
        .timeout(_timeout);

    return response;
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

    final response = await http
        .put(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
          body: body,
        )
        .timeout(_timeout);

    return response;
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

    final response = await http
        .delete(
          Uri.parse(
            Constant.apiUrl + endpoint,
          ),
          headers: headers,
          body: body,
        )
        .timeout(_timeout);

    return response;
  }
}
