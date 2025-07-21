import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/episodes/episode_controller.dart';
import 'package:application/dtos/grouped_episode_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

int i = 0;

class GroupedEpisodeComponent extends StatelessWidget {
  const GroupedEpisodeComponent({required this.episode, super.key});

  final GroupedEpisodeDto episode;

  @override
  Widget build(final BuildContext context) => CustomCard(
    onTap: () {
      Analytics.instance.logSelectContent('anime', episode.anime.uuid);

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (final BuildContext context) =>
              AnimeDetailsView(anime: episode.anime),
        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        EpisodeImage(
          uuid: episode.mappings.first,
          platforms: episode.platforms,
          duration: episode.duration,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constant.borderRadius),
          ),
          placeholderHeight: EpisodeController.instance.placeholderHeight(
            context,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          episode.anime.shortName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        EpisodeInformation(
          season: episode.season,
          episodeType: episode.episodeType,
          number: episode.number,
        ),
        ...episode.langTypes.map(
          (final String langType) => LangTypeComponent(langType: langType),
        ),
        const SizedBox(height: 8),
        EpisodeActionBar(
          anime: episode.anime.uuid,
          episode: episode.mappings.length == 1 ? episode.mappings.first : null,
          url: episode.urls.first,
          showWatchlistButton: episode.mappings.length == 1,
          inWatchlist: episode.inWatchlist,
          onFollowed: (final bool followed) {
            EpisodeController.instance.markAs(episode, followed);
          },
        ),
      ],
    ),
  );
}
