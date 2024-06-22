import 'dart:async';

import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/season_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

class AnimeDetailsController {
  static AnimeDetailsController instance = AnimeDetailsController();
  final episodes = <EpisodeMappingDto>[];
  final scrollController = ScrollController();
  final streamController =
      StreamController<List<EpisodeMappingDto>>.broadcast();
  int page = 1;
  bool isLoading = false;
  bool canLoadMore = true;

  AnimeDto? anime;
  SeasonDto? season;

  Future<void> init() async {
    episodes.clear();
    streamController.add(episodes);

    page = 1;
    isLoading = false;
    canLoadMore = true;
    await nextPage();

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

  void dispose() {
    anime = null;
    season = null;
    episodes.clear();
    streamController.add(episodes);
  }

  Future<void> refresh() async {
    episodes.clear();
    page = 1;
    isLoading = false;
    canLoadMore = true;
    await nextPage();
  }

  Future<void> nextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    try {
      final pageableDto = await HttpRequest.instance.getPage(
        '/v1/episode-mappings?anime=${anime?.uuid}${season != null ? '&season=${season!.number}' : ''}&${SortController.instance.sortType.value}&page=$page&limit=4',
      );

      episodes.addAll(
        pageableDto.data
            .map((e) => EpisodeMappingDto.fromJson(e as Map<String, dynamic>)),
      );

      streamController.add(episodes);
      canLoadMore = episodes.length < pageableDto.total;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }
}
