import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/auth_viewmodel.dart';
import 'package:application/data/models/missed_anime_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/core/constants/constant.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;

class MissedAnimeController extends GenericController<MissedAnimeDto> {
  MissedAnimeController({ApiClient? client})
    : _client = client ?? const ApiClient();
  static final MissedAnimeController instance = MissedAnimeController();
  final ApiClient _client;

  int get limit =>
      Constant.isAndroidOrIOS &&
          wb.WidgetBuilder.getDeviceType() == wb.DeviceType.mobile
      ? 9
      : 24;

  void setItems(final List<MissedAnimeDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Pair<Iterable<MissedAnimeDto>, int>> fetchItems() =>
      _fetchItems(isRetry: false);

  Future<Pair<Iterable<MissedAnimeDto>, int>> _fetchItems({
    required final bool isRetry,
  }) async {
    final result = await _client.getPage(
      '/v1/animes/missed',
      query: <String, Object>{'page': page, 'limit': limit},
      token: AuthViewModel.instance.member!.token,
    );

    if (result is ApiFailure<PageableDto> && result.statusCode == 401) {
      if (isRetry) {
        throw Exception('Unauthorized after retry');
      }
      await AuthViewModel.instance.login();
      return _fetchItems(isRetry: true);
    }

    return switch (result) {
      ApiSuccess<PageableDto>(:final data) =>
        Pair<Iterable<MissedAnimeDto>, int>(
          data.data.map(
            (final dynamic e) =>
                MissedAnimeDto.fromJson(e as Map<String, dynamic>),
          ),
          data.total,
        ),
      ApiFailure<PageableDto>(:final error) => throw Exception(
        'Failed to fetch missed animes: $error',
      ),
    };
  }
}
