import 'dart:async';

import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

class EpisodeController {
  static EpisodeController instance = EpisodeController();
  final episodes = <EpisodeMappingDto>[];
  final scrollController = ScrollController();
  final streamController =
      StreamController<List<EpisodeMappingDto>>.broadcast();
  int page = 1;
  bool isLoading = false;
  bool canLoadMore = true;

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

  Future<void> goToTop() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    await init();
  }

  Future<void> nextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    try {
      final pageableDto = await HttpRequest.instance.getPage(
        '/v1/episode-mappings?sort=lastReleaseDateTime,animeName,season,episodeType,number&desc=lastReleaseDateTime,animeName,season,episodeType,number&page=$page&limit=6',
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
