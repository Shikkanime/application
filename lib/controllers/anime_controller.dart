import 'dart:async';
import 'dart:convert';

import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnimeController {
  static AnimeController instance = AnimeController();
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
          '${Constant.apiUrl}/v1/animes?simulcast=${SimulcastController.instance.current?.uuid}&sort=name&page=$page&limit=12',
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load animes');
      }

      final json =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      animes.addAll(
        (json['data'] as List)
            .map((e) => AnimeDto.fromJson(e as Map<String, dynamic>)),
      );
      streamController.add(animes);

      canLoadMore = animes.length < (json['total'] as int);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }
}
