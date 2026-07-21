import 'dart:async';

import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/searchable_controller.dart';
import 'package:application/data/models/anime_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/data/models/enums/search_type.dart';
import 'package:application/core/analytics/analytics.dart';
import 'package:application/core/network/http_request.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;

class AnimeSearchController extends GenericController<AnimeDto>
    implements SearchableController {
  static final AnimeSearchController instance = AnimeSearchController();
  final ApiClient _client = const ApiClient();
  Timer? _timer;
  String query = '';
  @override
  SearchType? searchType;

  @override
  Future<void> onSearchTypeChanged() async => search(query);

  int get limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 6
      : 24;

  void search(final String query) {
    this.query = query;

    items.clear();
    streamController.add(items);
    page = 1;

    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 250), nextPage);
  }

  @override
  Future<Pair<Iterable<AnimeDto>, int>> fetchItems() async {
    final Map<String, Object> queryMap = <String, Object>{
      'country': 'FR',
      if (searchType != null) 'searchTypes': searchType!.name.toUpperCase(),
      if (query.isNotEmpty) 'name': Uri.encodeComponent(query),
      'page': page,
      'limit': limit,
      if (query.isEmpty) 'sort': 'name',
    };

    final ApiResult<PageableDto> result = await _client.getPage(
      '/v1/animes',
      query: queryMap,
    );

    Analytics.instance.logSearch(query, queryMap);

    return switch (result) {
      ApiSuccess<PageableDto>(:final data) => Pair<Iterable<AnimeDto>, int>(
        data.data.map(
          (final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>),
        ),
        data.total,
      ),
      ApiFailure<PageableDto>(:final error) => throw Exception(
        'Failed to search animes: $error',
      ),
    };
  }
}
