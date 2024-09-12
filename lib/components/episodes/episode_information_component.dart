import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EpisodeInformation extends StatelessWidget {
  final EpisodeMappingDto episode;
  final bool showSeason;

  const EpisodeInformation({
    super.key,
    required this.episode,
    this.showSeason = true,
  });

  @override
  Widget build(BuildContext context) {
    final episodeTypeString = AppLocalizations.of(context)!
        .episodeType(episode.episodeType.toLowerCase());

    return Text(
      showSeason
          ? AppLocalizations.of(context)!.fullInformation(
              episode.season,
              episodeTypeString,
              episode.number,
            )
          : AppLocalizations.of(context)!.minInformation(
              episodeTypeString,
              episode.number,
            ),
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
