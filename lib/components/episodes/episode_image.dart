import 'package:application/components/image_component.dart';
import 'package:application/components/platforms/list_platform.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';

class EpisodeImage extends StatelessWidget {
  final EpisodeMappingDto episode;
  final BorderRadius borderRadius;
  final double width;
  final double height;

  const EpisodeImage({
    super.key,
    required this.episode,
    required this.borderRadius,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageComponent(
          uuid: episode.uuid,
          borderRadius: borderRadius,
          width: width,
          height: height,
        ),
        Positioned(
          top: 5,
          right: 5,
          child: ListPlatform(platforms: episode.platforms),
        ),
      ],
    );
  }
}
