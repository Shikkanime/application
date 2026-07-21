import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/member_controller.dart';
import 'package:application/data/models/episode_mapping_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/core/network/http_request.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;

class FollowedEpisodeController extends GenericController<EpisodeMappingDto> {
  static final FollowedEpisodeController instance = FollowedEpisodeController();
  final ApiClient _client = const ApiClient();

  int get limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 9
      : 16;

  void setItems(final List<EpisodeMappingDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Pair<Iterable<EpisodeMappingDto>, int>> fetchItems() async {
    final ApiResult<PageableDto> result = await _client.getPage(
      '/v1/episode-mappings',
      query: <String, Object>{'page': page, 'limit': limit},
      token: MemberController.instance.member?.token,
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
        'Failed to fetch followed episodes: $error',
      ),
    };
  }

  @override
  void dispose() {
    if (items.length > limit) {
      items.removeRange(limit, items.length);
    }

    page = 1;
    streamController.add(items);
  }
}
