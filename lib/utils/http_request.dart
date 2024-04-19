import 'dart:convert';

import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static final instance = HttpRequest();

  Future<T> get<T>(String endpoint) async {
    final response = await http.get(
      Uri.parse(
        Constant.apiUrl + endpoint,
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }

    return jsonDecode(utf8.decode(response.bodyBytes)) as T;
  }

  Future<PageableDto> getPage(String endpoint) async {
    return PageableDto.fromJson(await get<Map<String, dynamic>>(endpoint));
  }
}
