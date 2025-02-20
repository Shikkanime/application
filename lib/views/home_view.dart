import 'dart:math';

import 'package:application/components/animes/missed_anime_component.dart';
import 'package:application/components/animes/missed_anime_loader_component.dart';
import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_component.dart';
import 'package:application/components/episodes/episode_loader_component.dart';
import 'package:application/controllers/animes/missed_anime_controller.dart';
import 'package:application/controllers/episodes/episode_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  List<Widget> _buildEpisodeList(
    final BuildContext context,
    final List<EpisodeMappingDto> episodes,
  ) {
    final double smallestDimension = MediaQuery.sizeOf(context).width;

    return <Widget>[
      StreamBuilder<List<MissedAnimeDto>>(
        stream: MissedAnimeController.instance.streamController.stream,
        initialData: MissedAnimeController.instance.items,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<MissedAnimeDto>> snapshot,
        ) {
          if (snapshot.data!.isEmpty) {
            return const SizedBox.shrink();
          }

          return CustomCard(
            margin: 12,
            child: Scrollbar(
              controller: MissedAnimeController.instance.scrollController,
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.whatYouMightHaveMissed1,
                      ),
                      Text(
                        AppLocalizations.of(context)!.whatYouMightHaveMissed2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 105,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            controller:
                                MissedAnimeController.instance.scrollController,
                            itemCount: snapshot.data!.length,
                            itemBuilder:
                                (final BuildContext context, final int index) =>
                                    MissedAnimeComponent(
                              missedAnime: snapshot.data![index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        episodes.map(
          (final EpisodeMappingDto episode) =>
              EpisodeComponent(episode: episode),
        ),
        maxElementsPerRow: max(1, (smallestDimension * 2 / 900).floor()),
      ),
    ];
  }

  @override
  Widget build(final BuildContext context) =>
      StreamBuilder<List<EpisodeMappingDto>>(
        stream: EpisodeController.instance.streamController.stream,
        initialData: EpisodeController.instance.items,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<EpisodeMappingDto>> snapshot,
        ) {
          if (snapshot.data!.isEmpty) {
            return const HomeLoaderView();
          }

          final List<Widget> list = _buildEpisodeList(context, snapshot.data!);

          return RefreshIndicator.adaptive(
            onRefresh: () async {
              await Future.wait(<Future<void>>[
                MissedAnimeController.instance.init(),
                EpisodeController.instance.init(),
              ]);
            },
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              controller: EpisodeController.instance.scrollController,
              itemCount: list.length,
              itemBuilder: (final BuildContext context, final int index) =>
                  list[index],
            ),
          );
        },
      );
}

class HomeLoaderView extends StatelessWidget {
  const HomeLoaderView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final List<Widget> list = <Widget>[
      CustomCard(
        margin: 12,
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 150,
              height: 14,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constant.borderRadius),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 105,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      itemCount: 12,
                      itemBuilder: (
                        final BuildContext context,
                        final int index,
                      ) =>
                          const MissedAnimeLoaderComponent(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        List<EpisodeLoaderComponent>.generate(
          12,
          (final int index) => const EpisodeLoaderComponent(),
        ),
        maxElementsPerRow: max(
          1,
          (MediaQuery.sizeOf(context).width * 2 / 900).floor(),
        ),
      ),
    ];

    return ListView.builder(
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      itemCount: list.length,
      itemBuilder: (final BuildContext context, final int index) => list[index],
    );
  }
}
