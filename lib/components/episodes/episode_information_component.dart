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

  String _episodeType(BuildContext context) {
    switch (episode.episodeType) {
      case 'EPISODE':
        return AppLocalizations.of(context)!.episode;
      case 'SPECIAL':
        return AppLocalizations.of(context)!.special;
      case 'FILM':
        return AppLocalizations.of(context)!.film;
      case 'SUMMARY':
        return AppLocalizations.of(context)!.summary;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      showSeason
          ? AppLocalizations.of(context)!.fullInformation(
              _episodeType(context),
              episode.number,
              AppLocalizations.of(context)!.season(episode.season),
            )
          : AppLocalizations.of(context)!.minInformation(
              _episodeType(context),
              episode.number,
            ),
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
