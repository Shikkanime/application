import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class AnimeController extends GenericController<AnimeDto> {
  static final AnimeController instance = AnimeController();

  SimulcastDto? selectedSimulcast;

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 6
          : 24;

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes?simulcast=${selectedSimulcast?.uuid}&sort=name&page=$page&limit=$_limit',
    );

    return pageableDto.data
        .map((final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>));
  }

  void onLongPress(
    final BuildContext context,
    final AnimeDto anime,
    final TapDownDetails? details,
  ) {
    if (details == null) {
      return;
    }

    final RenderBox renderBox =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    // Show dropdown menu
    showMenu<int>(
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & const Size(40, 40),
        Offset.zero & renderBox.size,
      ),
      items: <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 0,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              const Icon(Icons.checklist),
              const SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.markWatched),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              const Icon(Icons.share),
              const SizedBox(width: 8),
              Text(AppLocalizations.of(context)!.share),
            ],
          ),
        ),
      ],
    ).then((final int? value) async {
      if (value == 0) {
        await MemberController.instance.followAllEpisodes(anime);

        if (Constant.isAndroidOrIOS) {
          unawaited(Vibration.vibrate(pattern: <int>[0, 50, 125, 50, 125, 50]));
        }
      } else if (value == 1) {
        Analytics.instance.logShare('anime', anime.uuid, 'onLongPress');

        await Share.share(
          '${Constant.baseUrl}/animes/${anime.slug}',
        );
      }
    });
  }
}
