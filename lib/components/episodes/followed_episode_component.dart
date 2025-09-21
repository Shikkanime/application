import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/episode_source_dto.dart';
import 'package:application/utils/analytics.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/anime_details_view.dart';
import 'package:flutter/material.dart';

double _ratio = 4;

class FollowedEpisodeComponent extends StatelessWidget {
  const FollowedEpisodeComponent({required this.episode, super.key});

  final EpisodeMappingDto episode;

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: SizedBox(
      width: 640 / _ratio + 10,
      child: GestureDetector(
        onTap: () {
          if (episode.anime == null) {
            return;
          }

          Analytics.instance.logSelectContent('anime', episode.anime!.uuid);

          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (final BuildContext context) =>
                  AnimeDetailsView(anime: episode.anime!),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            EpisodeImage(
              uuid: episode.uuid,
              platforms: episode.sources
                  .map((final EpisodeSourceDto source) => source.platform)
                  .toSet()
                  .toList(),
              borderRadius: const BorderRadius.all(
                Radius.circular(Constant.borderRadius),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              episode.anime?.shortName ?? Constant.defaultText,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            EpisodeInformation(
              season: episode.season.toString(),
              episodeType: episode.episodeType,
              number: episode.number.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    ),
  );
}
