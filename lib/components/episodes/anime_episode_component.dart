import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_type_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';

class AnimeEpisodeComponent extends StatelessWidget {
  final EpisodeMappingDto episode;

  const AnimeEpisodeComponent({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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
                EpisodeTypeComponent(episode: episode),
                for (final langType in episode.langTypes)
                  LangTypeComponent(langType: langType),
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
