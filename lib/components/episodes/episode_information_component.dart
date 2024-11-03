import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EpisodeInformation extends StatelessWidget {
  const EpisodeInformation({
    required this.episode,
    super.key,
    this.showSeason = true,
  });

  final EpisodeMappingDto episode;
  final bool showSeason;

  @override
  Widget build(final BuildContext context) => Text(
        showSeason
            ? AppLocalizations.of(context)!.fullInformation(
                episode.season,
                AppLocalizations.of(context)!
                    .episodeType(episode.episodeType.toLowerCase()),
                episode.number,
              )
            : AppLocalizations.of(context)!.minInformation(
                AppLocalizations.of(context)!
                    .episodeType(episode.episodeType.toLowerCase()),
                episode.number,
              ),
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      );
}
