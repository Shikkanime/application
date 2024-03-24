import 'dart:async';
import 'dart:convert';

import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:http/http.dart' as http;

class SimulcastController {
  static SimulcastController instance = SimulcastController();
  final simulcasts = <SimulcastDto>[];
  SimulcastDto? current;

  Future<void> init() async {
    simulcasts.clear();

    final response = await http.get(
      Uri.parse(
        '${Constant.apiUrl}/v1/simulcasts',
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load simulcasts');
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    simulcasts.addAll(
      json.map((e) => SimulcastDto.fromJson(e as Map<String, dynamic>)),
    );

    if (simulcasts.isNotEmpty) {
      current = simulcasts.first;
    }
  }
}
