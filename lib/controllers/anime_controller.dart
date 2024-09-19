import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class AnimeController extends GenericController<AnimeDto> {
  static final instance = AnimeController();

  SimulcastDto? selectedSimulcast;

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    final pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes?simulcast=${selectedSimulcast?.uuid}&sort=name&page=$page&limit=6',
    );

    return pageableDto.data
        .map((e) => AnimeDto.fromJson(e as Map<String, dynamic>));
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
        Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
        MemberController.instance.followAllEpisodes(anime);
      } else if (value == 1) {
        Analytics.instance.logShare('anime', anime.uuid, 'onLongPress');

        Share.share(
          '${Constant.baseUrl}/animes/${anime.slug}',
        );
      }
    });
  }
}
