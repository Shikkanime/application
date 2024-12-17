import 'package:application/components/episodes/episode_duration.dart';
import 'package:application/components/image_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:flutter/material.dart';

const double _cornerPadding = 7.5;

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
            fit: fit,
            borderRadius: borderRadius,
            width: width,
            height: height,
          ),
          if (episode.platforms != null && episode.platforms!.isNotEmpty)
            for (final PlatformDto platform in episode.platforms!)
              Positioned(
                right:
                    _cornerPadding + episode.platforms!.indexOf(platform) * 10,
                top: _cornerPadding,
                child: PlatformComponent(platform: platform),
              ),
          if (showDuration)
            Positioned(
              bottom: _cornerPadding,
              right: _cornerPadding,
              child: EpisodeDuration(
                episode: episode,
                cornerPadding: _cornerPadding,
              ),
            ),
        ],
      );
}
