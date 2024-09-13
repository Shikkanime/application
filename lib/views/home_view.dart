import 'dart:math';

import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_component.dart';
import 'package:application/components/animes/missed_anime_component.dart';
import 'package:application/controllers/episode_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  List<Widget> _buildEpisodeList(
    BuildContext context,
    List<EpisodeMappingDto> episodes,
  ) {
    final smallestDimension = MediaQuery.of(context).size.width;

    return [
      const MissedAnimesRow(),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        episodes.map((episode) => EpisodeComponent(episode: episode)),
        maxElementsPerRow: max(1, (smallestDimension * 2 / 600).floor()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EpisodeMappingDto>>(
      stream: EpisodeController.instance.streamController.stream,
      initialData: EpisodeController.instance.items,
      builder: (context, snapshot) {
        final list = _buildEpisodeList(context, snapshot.data!);

        return RefreshIndicator.adaptive(
          onRefresh: () async {
            await EpisodeController.instance.init();
            await MissedAnimeController.instance.init();
          },
          child: ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            controller: EpisodeController.instance.scrollController,
            itemCount: list.length,
            itemBuilder: (context, index) => list[index],
          ),
        );
      },
    );
  }
}

class MissedAnimesRow extends StatelessWidget {
  const MissedAnimesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MissedAnimeDto>>(
      stream: MissedAnimeController.instance.streamController.stream,
      initialData: MissedAnimeController.instance.items,
      builder: (context, snapshot) {
        if (snapshot.data!.isEmpty) {
          return const SizedBox();
        }

        return CustomCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Text(AppLocalizations.of(context)!.whatYouMightHaveMissed1),
                    Text(
                      AppLocalizations.of(context)!.whatYouMightHaveMissed2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 115,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: false,
                        controller:
                            MissedAnimeController.instance.scrollController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => MissedAnimeComponent(
                          missedAnime: snapshot.data![index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
