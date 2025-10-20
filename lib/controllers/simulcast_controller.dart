import 'package:application/controllers/animes/anime_controller.dart';
import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/http_request.dart';

class SimulcastController extends GenericController<SimulcastDto> {
  static final SimulcastController instance = SimulcastController();

  @override
  Future<Pair<Iterable<SimulcastDto>, int>> fetchItems() async {
    final List<dynamic> json = await HttpRequest.instance.get<List<dynamic>>(
      '/v1/simulcasts',
    );

    final Iterable<SimulcastDto> list = json.map(
      (final dynamic e) => SimulcastDto.fromJson(e as Map<String, dynamic>),
    );

    if (list.isNotEmpty) {
      AnimeController.instance.selectedSimulcast = list.first;
    }

    return Pair<Iterable<SimulcastDto>, int>(list, list.length);
  }
}
