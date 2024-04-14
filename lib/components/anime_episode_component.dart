import 'package:application/components/card_component.dart' as card;
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnimeEpisodeComponent extends StatelessWidget {
  final EpisodeDto episode;

  const AnimeEpisodeComponent({
    super.key,
    required this.episode,
  });

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
    return card.Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: EpisodeImage(
              episode: episode,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              height: 130,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episode.title ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  AppLocalizations.of(context)!.information(
                    _episodeType(context),
                    episode.number,
                    episode.season,
                    episode.uncensored
                        ? AppLocalizations.of(context)!.uncensored
                        : '',
                  ),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                LangTypeComponent(langType: episode.langType),
                EpisodeActionBar(episode: episode),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
