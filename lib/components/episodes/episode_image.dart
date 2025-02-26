import 'package:application/components/episodes/episode_duration.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class EpisodeImage extends StatelessWidget {
  const EpisodeImage({
    required this.episode,
    required this.borderRadius,
    super.key,
    this.fit = BoxFit.fill,
    this.width = double.infinity,
    this.height = double.infinity,
    this.showDuration = true,
  });

  final EpisodeMappingDto episode;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final double width;
  final double height;
  final bool showDuration;

  @override
  Widget build(final BuildContext context) => Stack(
    children: <Widget>[
      ImageComponent(
        uuid: episode.uuid,
        version:
            episode.lastUpdateDateTime
                .toDateTime()
                ?.millisecondsSinceEpoch
                .toString(),
        fit: fit,
        borderRadius: borderRadius,
        width: width,
        height: height,
      ),
      if (episode.platforms != null && episode.platforms!.isNotEmpty)
        ...PlatformComponent.toPlatformsRow(episode.platforms!),
      if (showDuration)
        Positioned(
          bottom: Constant.cornerPadding,
          right: Constant.cornerPadding,
          child: EpisodeDuration(
            episode: episode,
            cornerPadding: Constant.cornerPadding,
          ),
        ),
    ],
  );
}
