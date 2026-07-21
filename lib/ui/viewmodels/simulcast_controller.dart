import 'package:application/ui/viewmodels/animes/anime_controller.dart';
import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/data/models/simulcast_dto.dart';
import 'package:application/core/network/http_request.dart';
import 'package:application/core/network/api_result.dart';

class SimulcastController extends GenericController<SimulcastDto> {
  static final SimulcastController instance = SimulcastController();
  final ApiClient _client = const ApiClient();

  @override
  Future<Pair<Iterable<SimulcastDto>, int>> fetchItems() async {
    final ApiResult<List<dynamic>> result = await _client.get<List<dynamic>>(
      '/v1/simulcasts',
    );

    return switch (result) {
      ApiSuccess<List<dynamic>>(:final data) => _handleSimulcastSuccess(data),
      ApiFailure<List<dynamic>>(:final error) => throw Exception(
        'Failed to load simulcasts: $error',
      ),
    };
  }

  Pair<Iterable<SimulcastDto>, int> _handleSimulcastSuccess(
    final List<dynamic> data,
  ) {
    final Iterable<SimulcastDto> list = data.map(
      (final dynamic e) => SimulcastDto.fromJson(e as Map<String, dynamic>),
    );

    if (list.isNotEmpty) {
      AnimeController.instance.selectedSimulcast = list.first;
    }

    return Pair<Iterable<SimulcastDto>, int>(list, list.length);
  }
}
