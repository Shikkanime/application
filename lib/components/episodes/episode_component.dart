import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class EpisodeComponent extends StatelessWidget {
  final EpisodeMappingDto episode;

  const EpisodeComponent({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EpisodeImage(
            episode: episode,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Constant.borderRadius),
              topRight: Radius.circular(Constant.borderRadius),
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
                        episode.anime?.shortName ?? Constant.defaultText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      EpisodeInformation(episode: episode),
                      if (episode.langTypes != null)
                        for (final langType in episode.langTypes!)
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
