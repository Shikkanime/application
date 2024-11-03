import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class EpisodeComponent extends StatelessWidget {
  const EpisodeComponent({
    required this.episode,
    super.key,
    this.showWatchlist = true,
  });

  final EpisodeMappingDto episode;
  final bool showWatchlist;

  @override
  Widget build(final BuildContext context) => CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EpisodeImage(
              fit: BoxFit.cover,
              episode: episode,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constant.borderRadius),
              ),
              height: 200,
            ),
            const SizedBox(height: 8),
            Text(
              episode.anime?.shortName ?? Constant.defaultText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            EpisodeInformation(episode: episode),
            if (episode.langTypes != null)
              for (final String langType in episode.langTypes!)
                LangTypeComponent(langType: langType),
            const SizedBox(height: 8),
            EpisodeActionBar(
              episode: episode,
              showWatchlist: showWatchlist,
            ),
          ],
        ),
      );
}
