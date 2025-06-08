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
    if (episodes.isEmpty) {
      return <Widget>[
        const MissedAnimesLoaderRow(),
        ...wb.WidgetBuilder.instance.buildRowWidgets(
          List<EpisodeLoaderComponent>.generate(
            12,
            (final int index) => const EpisodeLoaderComponent(),
          ),
          maxElementsPerRow: EpisodeController.instance.maxElementsPerRow(
            context,
          ),
        ),
      ];
    }

    return <Widget>[
      const MissedAnimesRow(),
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        episodes.map(
          (final GroupedEpisodeDto episode) =>
              GroupedEpisodeComponent(episode: episode),
        ),
        maxElementsPerRow: EpisodeController.instance.maxElementsPerRow(
          context,
        ),
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
