import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/sort_controller.dart';
import 'package:application/data/models/anime_dto.dart';
import 'package:application/data/models/episode_mapping_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/data/models/season_dto.dart';
import 'package:application/core/network/http_request.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;

class AnimeDetailsController extends GenericController<EpisodeMappingDto> {
  static final AnimeDetailsController instance = AnimeDetailsController();
  final ApiClient _client = const ApiClient();

  AnimeDto? anime;
  SeasonDto? season;

  int get limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 4
      : 24;

  @override
  Future<Pair<Iterable<EpisodeMappingDto>, int>> fetchItems() async {
    final ApiResult<PageableDto> result = await _client.getPage(
      '/v1/episode-mappings',
      query: <String, Object>{
        if (anime != null) 'anime': anime!.uuid,
        if (season != null) 'season': season!.number,
        ...SortController.instance.sortType.value,
        'page': page,
        'limit': limit,
      },
    );

    return switch (result) {
      ApiSuccess<PageableDto>(:final data) =>
        Pair<Iterable<EpisodeMappingDto>, int>(
          data.data.map(
            (final dynamic e) =>
                EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
          ),
          data.total,
        ),
      ApiFailure<PageableDto>(:final error) => throw Exception(
        'Failed to load episodes: $error',
      ),
    };
  }
}
