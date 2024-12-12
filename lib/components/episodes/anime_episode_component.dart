import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class AnimeEpisodeComponent extends StatelessWidget {
  const AnimeEpisodeComponent({
    required this.episode,
    super.key,
  });

  final EpisodeMappingDto episode;

  @override
  Widget build(final BuildContext context) => CustomCard(
        child: SizedBox(
          height: 170,
          child: Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: EpisodeImage(
                  episode: episode,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constant.borderRadius),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      episode.title ?? Constant.defaultText,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    EpisodeInformation(episode: episode, showSeason: false),
                    if (episode.langTypes != null)
                      for (final String langType in episode.langTypes!)
                        LangTypeComponent(langType: langType),
                    const Spacer(),
                    EpisodeActionBar(
                      episode: episode,
                      simple: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
