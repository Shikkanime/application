import 'dart:async';

import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/http_request.dart';

class SimulcastController {
  static SimulcastController instance = SimulcastController();
  final simulcasts = <SimulcastDto>[];
  SimulcastDto? current;

  Future<void> init() async {
    simulcasts.clear();

    final json = await HttpRequest.instance.get<List>('/v1/simulcasts');

    simulcasts.addAll(
      json.map((e) => SimulcastDto.fromJson(e as Map<String, dynamic>)),
    );

    if (simulcasts.isNotEmpty) {
      current = simulcasts.first;
    }
  }
}
