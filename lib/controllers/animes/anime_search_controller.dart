import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/searchable_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/enums/search_type.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class AnimeSearchController extends GenericController<AnimeDto>
    implements SearchableController {
  static final AnimeSearchController instance = AnimeSearchController();
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

    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes',
      query: queryMap,
    );

    Analytics.instance.logSearch(query, queryMap);

    return Pair<Iterable<AnimeDto>, int>(
      pageableDto.data.map(
        (final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>),
      ),
      pageableDto.total,
    );
  }
}
