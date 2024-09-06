import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

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
      final pageableDto = await HttpRequest.instance.getPage(
        '/v1/animes?simulcast=${SimulcastController.instance.current?.uuid}&sort=name&page=$page&limit=6',
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

  void onLongPress(
    BuildContext context,
    AnimeDto anime,
    TapDownDetails? details,
  ) {
    if (details == null) {
      return;
    }

    final RenderBox renderBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    // Show dropdown menu
    showMenu<int>(
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & const Size(40, 40),
        Offset.zero & renderBox.size,
      ),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(AppLocalizations.of(context)!.markWatched),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(AppLocalizations.of(context)!.share),
        ),
      ],
    ).then((value) {
      if (value == 0) {
        MemberController.instance
            .followAllEpisodes(anime)
            .then((value) => MissedAnimeController.instance.init());
        Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
      } else if (value == 1) {
        Analytics.instance.logShare('anime', anime.uuid, 'onLongPress');

        Share.share(
          '${Constant.baseUrl}/animes/${anime.slug}',
        );
      }
    });
  }
}
