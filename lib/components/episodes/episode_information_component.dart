import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EpisodeInformation extends StatelessWidget {
  const EpisodeInformation({
    required this.season,
    required this.episodeType,
    required this.number,
    super.key,
    this.showSeason = true,
    this.style,
  });

  final String season;
  final String episodeType;
  final String number;
  final bool showSeason;
  final TextStyle? style;

  @override
  Widget build(final BuildContext context) => Text(
    showSeason
        ? AppLocalizations.of(context)!.fullInformation(
          season,
          AppLocalizations.of(context)!.episodeType(episodeType.toLowerCase()),
          number,
        )
        : AppLocalizations.of(context)!.minInformation(
          AppLocalizations.of(context)!.episodeType(episodeType.toLowerCase()),
          number,
        ),
    style: style ?? Theme.of(context).textTheme.bodyMedium,
    overflow: TextOverflow.ellipsis,
  );
}
