import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
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

class AnimeController extends GenericController<AnimeDto> {
  static final AnimeController instance = AnimeController();

  SimulcastDto? selectedSimulcast;

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 6
          : 24;

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    if (selectedSimulcast == null) {
      return <AnimeDto>[];
    }

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
            spacing: 8,
            direction: Axis.horizontal,
            children: <Widget>[
              const Icon(Icons.checklist),
              Text(AppLocalizations.of(context)!.markWatched),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Flex(
            spacing: 8,
            direction: Axis.horizontal,
            children: <Widget>[
              const Icon(Icons.share),
              Text(AppLocalizations.of(context)!.share),
            ],
          ),
        ),
      ],
    ).then((final int? value) async {
      if (value == 0) {
        await MemberController.instance.followAllEpisodes(anime);
        VibrationController.instance
            .vibrate(pattern: <int>[0, 50, 125, 50, 125, 50]);
      } else if (value == 1) {
        Analytics.instance.logShare('anime', anime.uuid, 'onLongPress');

        await Share.share(
          '${Constant.baseUrl}/animes/${anime.slug}',
        );
      }
    });
  }
}
