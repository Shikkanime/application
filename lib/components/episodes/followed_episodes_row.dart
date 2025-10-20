import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/followed_episode_component.dart';
import 'package:application/components/episodes/followed_episode_loader_component.dart';
import 'package:application/controllers/episodes/followed_episode_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FollowedEpisodesRow extends StatelessWidget {
  const FollowedEpisodesRow({super.key});

  List<Widget> _buildEpisodeList(
    final BuildContext context,
    final List<EpisodeMappingDto> episodes,
  ) => <Widget>[
    ...episodes.map(
      (final EpisodeMappingDto episode) =>
          FollowedEpisodeComponent(episode: episode),
    ),
    if (FollowedEpisodeController.instance.isLoading)
      ...List<Widget>.generate(
        FollowedEpisodeController.instance.limit,
        (final int index) => const FollowedEpisodeLoaderComponent(),
      ),
  ];

  @override
  Widget build(final BuildContext context) => CustomCard(
    padding: false,
    child: Scrollbar(
      controller: FollowedEpisodeController.instance.scrollController,
      child: StreamBuilder<List<EpisodeMappingDto>>(
        stream: FollowedEpisodeController.instance.streamController.stream,
        initialData: FollowedEpisodeController.instance.items,
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<List<EpisodeMappingDto>> snapshot,
            ) {
              final List<Widget> list = _buildEpisodeList(
                context,
                snapshot.data ?? <EpisodeMappingDto>[],
              );

              return Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.yourRecentlyViewedEpisodes1,
                      ),
                      Text(
                        AppLocalizations.of(
                          context,
                        )!.yourRecentlyViewedEpisodes2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (snapshot.data!.isEmpty &&
                      !FollowedEpisodeController.instance.isLoading)
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.noWatchedEpisode,
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 132,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              itemCount: list.length,
                              controller: FollowedEpisodeController
                                  .instance
                                  .scrollController,
                              itemBuilder:
                                  (
                                    final BuildContext context,
                                    final int index,
                                  ) => list[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
      ),
    ),
  );
}
