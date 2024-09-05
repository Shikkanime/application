import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

class FollowedAnimeController {
  static FollowedAnimeController instance = FollowedAnimeController();
  final animes = <AnimeDto>[];
  final scrollController = ScrollController();
  final streamController = StreamController<List<AnimeDto>>.broadcast();
  int page = 1;
  bool isLoading = false;
  bool canLoadMore = true;

  Future<void> init() async {
    animes.clear();
    streamController.add(animes);

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

  Future<void> nextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    try {
      final pageableDto = await HttpRequest.instance.getPage(
        '/v1/animes?page=$page&limit=8',
        token: MemberController.instance.member?.token,
      );

      animes.addAll(
        pageableDto.data
            .map((e) => AnimeDto.fromJson(e as Map<String, dynamic>)),
      );

      streamController.add(animes);
      canLoadMore = animes.length < pageableDto.total;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }
}
