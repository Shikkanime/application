import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/widgets.dart';

enum SearchType { subtitles, voice }

class AnimeSearchController extends GenericController<AnimeDto> {
  static final instance = AnimeSearchController();
  Timer? _timer;
  String query = '';
  final searchTypes = SearchType.values.toSet();

  void search(String query) {
    this.query = query;

    items.clear();
    streamController.add(items);
    page = 1;

    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 250),
      () => nextPage(),
    );
  }

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    final searchTypesString =
        searchTypes.map((e) => e.name.toUpperCase()).join(',');

    final Map<String, Object> queryMap = {
      'country': 'FR',
      'searchTypes': searchTypesString,
      if (query.isNotEmpty) 'name': Uri.encodeComponent(query),
      'page': page,
      'limit': 6,
      if (query.isEmpty) 'sort': 'name',
    };

    final queryString =
        queryMap.entries.map((e) => '${e.key}=${e.value}').join('&');

    debugPrint('$runtimeType - Query: $queryString');

    final pageableDto =
        await HttpRequest.instance.getPage('/v1/animes?$queryString');

    Analytics.instance.logSearch(query, queryMap);

    return pageableDto.data
        .map((e) => AnimeDto.fromJson(e as Map<String, dynamic>));
  }
}
