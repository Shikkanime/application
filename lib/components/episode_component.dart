import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EpisodeComponent extends StatelessWidget {
  final EpisodeMappingDto episode;

  const EpisodeComponent({
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
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EpisodeImage(
            episode: episode,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            height: 200,
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        episode.anime.shortName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        AppLocalizations.of(context)!.information(
                          _episodeType(context),
                          episode.number,
                          episode.season,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      for (final langType in episode.langTypes)
                        LangTypeComponent(langType: langType),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: EpisodeActionBar(episode: episode),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
