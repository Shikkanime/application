import 'package:application/components/animes/missed/missed_animes_loader_row.dart';
import 'package:application/components/animes/missed/missed_animes_row.dart';
import 'package:application/components/episodes/episode_loader_component.dart';
import 'package:application/components/episodes/grouped_episode_component.dart';
import 'package:application/controllers/animes/missed_anime_controller.dart';
import 'package:application/controllers/episodes/episode_controller.dart';
import 'package:application/dtos/grouped_episode_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  List<Widget> _buildEpisodeList(
    final BuildContext context,
    final List<GroupedEpisodeDto> episodes,
  ) {
    final int maxElementsPerRow = EpisodeController.instance.maxElementsPerRow(
      context,
    );

    final List<Widget> loaders = List<EpisodeLoaderComponent>.generate(
      EpisodeController.instance.limit,
      (final int index) => const EpisodeLoaderComponent(),
    );

    final Widget header;
    final List<Widget> itemsToGrid = <Widget>[];

    if (episodes.isEmpty) {
      header = const MissedAnimesLoaderRow();
      itemsToGrid.addAll(loaders);
    } else {
      header = const MissedAnimesRow();
      itemsToGrid.addAll(
        episodes.map(
          (final GroupedEpisodeDto episode) =>
              GroupedEpisodeComponent(episode: episode),
        ),
      );

      if (EpisodeController.instance.isLoading) {
        itemsToGrid.addAll(loaders);
      }
    }

    return <Widget>[
      header,
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        itemsToGrid,
        maxElementsPerRow: maxElementsPerRow,
      ),
    ];
  }

  @override
  Widget build(final BuildContext context) =>
      StreamBuilder<List<GroupedEpisodeDto>>(
        stream: EpisodeController.instance.streamController.stream,
        initialData: EpisodeController.instance.items,
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<List<GroupedEpisodeDto>> snapshot,
            ) {
              final List<Widget> list = _buildEpisodeList(
                context,
                snapshot.data!,
              );

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
