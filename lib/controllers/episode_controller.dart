import 'dart:async';
import 'dart:convert';

import 'package:application/dtos/episode_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EpisodeController {
  static EpisodeController instance = EpisodeController();
  final episodes = <EpisodeDto>[];
  final scrollController = ScrollController();
  final streamController = StreamController<List<EpisodeDto>>();
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

      if (position.pixels >= position.maxScrollExtent - 200 &&
          !isLoading &&
          canLoadMore) {
        nextPage();
        debugPrint('Loading more episodes');
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
      final response = await http.get(
        Uri.parse(
          'https://api.shikkanime.fr/v1/episodes?sort=releaseDateTime,season,number,episodeType,langType&desc=releaseDateTime,season,number&page=$page&limit=15',
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load episodes');
      }

      final json =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      episodes.addAll(
        (json['data'] as List)
            .map((e) => EpisodeDto.fromJson(e as Map<String, dynamic>)),
      );
      streamController.add(episodes);

      canLoadMore = episodes.length < (json['total'] as int);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }
}
