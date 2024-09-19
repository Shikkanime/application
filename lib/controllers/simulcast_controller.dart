import 'dart:async';

import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/http_request.dart';

class SimulcastController extends GenericController<SimulcastDto> {
  static SimulcastController instance = SimulcastController();

  @override
  Future<Iterable<SimulcastDto>> fetchItems() async {
    final json = await HttpRequest.instance.get<List>('/v1/simulcasts');
    final list =
        json.map((e) => SimulcastDto.fromJson(e as Map<String, dynamic>));

    if (list.isNotEmpty) {
      AnimeController.instance.selectedSimulcast = list.first;
    }

    return list;
  }
}
