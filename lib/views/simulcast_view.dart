import 'package:application/components/animes/anime_component.dart';
import 'package:application/components/elevated_dropdown_button.dart';
import 'package:application/controllers/anime_controller.dart';
import 'package:application/controllers/simulcast_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SimulcastView extends StatelessWidget {
  const SimulcastView({super.key});

  List<Widget> _buildAnimeList(BuildContext context, List<AnimeDto> animes) {
    final widgets = <Widget>[];

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedDropdownButton<SimulcastDto>(
              globalKey: GlobalKey(),
              value: AnimeController.instance.selectedSimulcast,
              items: [
                for (final simulcast in SimulcastController.instance.items)
                  ElevatedPopupMenuItem(
                    value: simulcast,
                    child: Text(
                      AppLocalizations.of(context)!
                          .simulcastSeason(simulcast.season, simulcast.year),
                    ),
                  ),
              ],
              onChanged: (value) {
                Analytics.instance.logSelectContent('simulcast', value.uuid);
                AnimeController.instance.selectedSimulcast = value;
                AnimeController.instance.goToTop();
              },
            ),
          ],
        ),
      ),
    );

    for (int i = 0; i < animes.length; i += 2) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: AnimeComponent(anime: animes[i])),
            if (i + 1 < animes.length)
              Expanded(child: AnimeComponent(anime: animes[i + 1]))
            else
              const Spacer(),
          ],
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AnimeDto>>(
      stream: AnimeController.instance.streamController.stream,
      initialData: AnimeController.instance.items,
      builder: (context, snapshot) {
        final list = _buildAnimeList(context, snapshot.data!);

        return RefreshIndicator.adaptive(
          onRefresh: () async {
            await AnimeController.instance.init();
          },
          child: ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            controller: AnimeController.instance.scrollController,
            itemCount: list.length,
            itemBuilder: (context, index) => list[index],
          ),
        );
      },
    );
  }
}
