import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/auth_viewmodel.dart';
import 'package:application/data/models/anime_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;

class FollowedAnimeController extends GenericController<AnimeDto> {
  FollowedAnimeController({ApiClient? client})
    : _client = client ?? const ApiClient();
  static final FollowedAnimeController instance = FollowedAnimeController();
  final ApiClient _client;

  int get limit =>
      wb.WidgetBuilder.getDeviceType() == wb.DeviceType.mobile ? 9 : 24;

  void setItems(final List<AnimeDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Pair<Iterable<AnimeDto>, int>> fetchItems() =>
      _fetchItems(isRetry: false);

  Future<Pair<Iterable<AnimeDto>, int>> _fetchItems({
    required final bool isRetry,
  }) async {
    final result = await _client.getPage(
      '/v1/animes',
      query: <String, Object>{'page': page, 'limit': limit},
      token: AuthViewModel.instance.member?.token,
    );

    if (result is ApiFailure<PageableDto> && result.statusCode == 401) {
      if (isRetry) {
        throw Exception('Unauthorized after retry');
      }
      await AuthViewModel.instance.login();
      return _fetchItems(isRetry: true);
    }

    return switch (result) {
      ApiSuccess<PageableDto>(:final data) => Pair<Iterable<AnimeDto>, int>(
        data.data.map(
          (final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>),
        ),
        data.total,
      ),
      ApiFailure<PageableDto>(:final error) => throw Exception(
        'Failed to fetch followed animes: $error',
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
