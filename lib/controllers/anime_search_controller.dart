import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/widgets.dart';

enum SearchType { subtitles, voice }

class AnimeSearchController extends GenericController<AnimeDto> {
  static final AnimeSearchController instance = AnimeSearchController();
  Timer? _timer;
  String query = '';
  final Set<SearchType> searchTypes = SearchType.values.toSet();

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 6
          : 24;

  void search(final String query) {
    this.query = query;

    items.clear();
    streamController.add(items);
    page = 1;

    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 250),
      nextPage,
    );
  }

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    final String searchTypesString =
        searchTypes.map((final SearchType e) => e.name.toUpperCase()).join(',');

    final Map<String, Object> queryMap = <String, Object>{
      'country': 'FR',
      'searchTypes': searchTypesString,
      if (query.isNotEmpty) 'name': Uri.encodeComponent(query),
      'page': page,
      'limit': _limit,
      if (query.isEmpty) 'sort': 'name',
    };

    final String queryString = queryMap.entries
        .map((final MapEntry<String, Object> e) => '${e.key}=${e.value}')
        .join('&');

    debugPrint('Query: $queryString');

    final PageableDto pageableDto =
        await HttpRequest.instance.getPage('/v1/animes?$queryString');

    Analytics.instance.logSearch(query, queryMap);

    return pageableDto.data
        .map((final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>));
  }
}
