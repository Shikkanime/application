import 'dart:async';

import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

enum SearchType { subtitles, voice }

class AnimeSearchController {
  static AnimeSearchController instance = AnimeSearchController();
  final animes = <AnimeDto>[];
  final scrollController = ScrollController();
  final streamController = StreamController<List<AnimeDto>>.broadcast();
  int page = 1;
  Timer? _timer;
  bool isLoading = false;
  bool canLoadMore = true;
  String query = '';
  final searchTypes = SearchType.values.toSet();

  void init() {
    page = 1;
    isLoading = false;
    canLoadMore = true;

    scrollController.addListener(() {
      // If the user is going to the end of the list
      final position = scrollController.position;

      if (position.pixels >= position.maxScrollExtent - 300 &&
          !isLoading &&
          canLoadMore) {
        nextPage();
      }
    });
  }

  void search(String query) {
    this.query = query;
    animes.clear();
    streamController.add(animes);
    page = 1;

    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 250),
      () => nextPage(),
    );
  }

  void dispose() {
    query = '';
    animes.clear();
    streamController.add(animes);
  }

  Future<void> nextPage() async {
    if (isLoading || query.isEmpty) {
      return;
    }

    isLoading = true;

    try {
      final searchTypesString =
          searchTypes.map((e) => e.name.toUpperCase()).join(',');
      final pageableDto = await HttpRequest.instance.getPage(
          '/v1/animes?country=FR&name=${Uri.encodeComponent(query)}&page=$page&limit=6&searchTypes=$searchTypesString');

      animes.addAll(
        pageableDto.data
            .map((e) => AnimeDto.fromJson(e as Map<String, dynamic>)),
      );

      streamController.add(animes);
      canLoadMore = animes.length < pageableDto.total;

      Analytics.instance.logSearch(query, {
        'page': page,
        'searchTypes': searchTypesString,
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }
}
