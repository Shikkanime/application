import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EpisodeTypeComponent extends StatelessWidget {
  final EpisodeMappingDto episode;

  const EpisodeTypeComponent({super.key, required this.episode});

  String _episodeType(BuildContext context) {
    switch (episode.episodeType) {
      case 'EPISODE':
        return AppLocalizations.of(context)!.episode;
      case 'SPECIAL':
        return AppLocalizations.of(context)!.special;
      case 'FILM':
        return AppLocalizations.of(context)!.film;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.information(
        _episodeType(context),
        episode.number,
        episode.season,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
