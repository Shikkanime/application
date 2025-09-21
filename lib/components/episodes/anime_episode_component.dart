import 'package:application/components/card_component.dart';
import 'package:application/components/episodes/episode_action_bar.dart';
import 'package:application/components/episodes/episode_image.dart';
import 'package:application/components/episodes/episode_information_component.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/episode_source_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class AnimeEpisodeComponent extends StatelessWidget {
  const AnimeEpisodeComponent({
    required this.episode,
    super.key,
    this.onDoubleAndLongPress,
    this.isSelected = false,
  });

  final EpisodeMappingDto episode;
  final void Function()? onDoubleAndLongPress;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) => CustomCard(
    onDoubleTap: onDoubleAndLongPress,
    onLongPress: (final TapDownDetails? details) {
      onDoubleAndLongPress?.call();
    },
    isSelected: isSelected,
    child: SizedBox(
      height: 170,
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: EpisodeImage(
              uuid: episode.uuid,
              platforms: episode.sources
                  .map((final EpisodeSourceDto source) => source.platform)
                  .toSet()
                  .toList(),
              duration: episode.duration,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constant.borderRadius),
              ),
              fit: BoxFit.cover,
              height: double.infinity,
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
                EpisodeInformation(
                  season: episode.season.toString(),
                  episodeType: episode.episodeType,
                  number: episode.number.toString(),
                  showSeason: false,
                ),
                ...episode.sources
                    .map((final EpisodeSourceDto source) => source.langType)
                    .toSet()
                    .map(
                      (final String langType) =>
                          LangTypeComponent(langType: langType),
                    ),
                const Spacer(),
                EpisodeActionBar(
                  sources: episode.sources,
                  anime: episode.anime!.uuid,
                  episode: episode.uuid,
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
