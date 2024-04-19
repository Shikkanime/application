import 'dart:async';

import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

enum Sort {
  oldest(value: 'sort=season,episodeType,number&desc=episodeType'),
  newest(
    value:
        'sort=releaseDateTime,season,episodeType,number&desc=releaseDateTime,season,episodeType,number',
  ),
  ;

  final String value;

  const Sort({
    required this.value,
  });
}

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
  Sort sort = Sort.oldest;

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
    sort = Sort.oldest;
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
        '/v1/episode-mappings?anime=${anime?.uuid}&${sort.value}&page=$page&limit=6',
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
