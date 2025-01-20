import 'dart:math';

import 'package:application/components/animes/anime_component.dart';
import 'package:application/components/elevated_dropdown_button.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SimulcastView extends StatelessWidget {
  const SimulcastView({super.key});

  List<Widget> _buildAnimeList(
    final BuildContext context,
    final List<AnimeDto> animes,
  ) {
    final double smallestDimension = MediaQuery.sizeOf(context).width;

    return <Widget>[
      if (AnimeController.instance.selectedSimulcast != null &&
          SimulcastController.instance.items.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedDropdownButton<SimulcastDto>(
                globalKey: GlobalKey(),
                value: AnimeController.instance.selectedSimulcast,
                items: <ElevatedPopupMenuItem<SimulcastDto>>[
                  for (final SimulcastDto simulcast
                      in SimulcastController.instance.items)
                    ElevatedPopupMenuItem<SimulcastDto>(
                      value: simulcast,
                      child: Text(
                        AppLocalizations.of(context)!
                            .simulcastSeason(simulcast.season, simulcast.year),
                      ),
                    ),
                ],
                onChanged: (final SimulcastDto value) {
                  Analytics.instance.logSelectContent('simulcast', value.uuid);
                  AnimeController.instance.selectedSimulcast = value;
                  AnimeController.instance.goToTop();
                },
              ),
            ],
          ),
        ),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        animes.map((final AnimeDto anime) => AnimeComponent(anime: anime)),
        maxElementsPerRow: max(2, (smallestDimension * 3 / 600).floor()),
      ),
    ];
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<List<AnimeDto>>(
        stream: AnimeController.instance.streamController.stream,
        initialData: AnimeController.instance.items,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<AnimeDto>> snapshot,
        ) {
          final List<Widget> list = _buildAnimeList(context, snapshot.data!);

          return RefreshIndicator.adaptive(
            onRefresh: () async {
              await Future.wait(<Future<void>>[
                SimulcastController.instance.init(),
                AnimeController.instance.init(),
              ]);
            },
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              controller: AnimeController.instance.scrollController,
              itemCount: list.length,
              itemBuilder: (final BuildContext context, final int index) =>
                  list[index],
            ),
          );
        },
      );
}
