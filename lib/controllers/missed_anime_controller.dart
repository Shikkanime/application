import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class MissedAnimeController {
  static MissedAnimeController instance = MissedAnimeController();
  final missedAnimes = <MissedAnimeDto>[];
  final scrollController = ScrollController();
  final streamController = StreamController<List<MissedAnimeDto>>.broadcast();
  int page = 1;
  bool isLoading = false;
  bool canLoadMore = true;

  Future<void> init() async {
    missedAnimes.clear();
    page = 1;
    isLoading = false;
    canLoadMore = true;
    await loadPage();

    scrollController.addListener(() {
      // If the user is going to the end of the list
      final position = scrollController.position;

      if (position.pixels >= position.maxScrollExtent - 300 &&
          !isLoading &&
          canLoadMore) {
        loadPage();
      }
    });
  }

  Future<void> refresh() async {
    final currentPage = page;
    isLoading = false;
    canLoadMore = true;
    // Refresh only the page of the missed animes
    missedAnimes.clear();

    for (var i = 1; i < currentPage; i++) {
      page = i;
      await loadPage(emit: false);
    }

    streamController.add(missedAnimes);
  }

  Future<void> goToTop() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    await init();
  }

  Future<void> loadPage({bool emit = true}) async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    try {
      final pageableDto = await HttpRequest.instance.getPage(
        '/v1/animes/missed?page=$page&limit=6',
        token: MemberController.instance.member!.token,
      );

      missedAnimes.addAll(
        pageableDto.data
            .map((e) => MissedAnimeDto.fromJson(e as Map<String, dynamic>)),
      );

      if (emit) {
        streamController.add(missedAnimes);
      }

      canLoadMore = missedAnimes.length < pageableDto.total;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      page++;
    }
  }

  void onLongPress(
    BuildContext context,
    MissedAnimeDto missedAnime,
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
            .followAllEpisodes(missedAnime.anime)
            .then((value) => refresh());
        Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
      } else if (value == 1) {
        Share.share(
          '${Constant.baseUrl}/animes/${missedAnime.anime.slug}',
        );
      }
    });
  }
}
