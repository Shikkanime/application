import 'package:application/components/image_component.dart';
import 'package:application/components/platforms/list_platform.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';

class EpisodeImage extends StatelessWidget {
  final EpisodeMappingDto episode;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final double width;
  final double height;

  const EpisodeImage({
    super.key,
    required this.episode,
    required this.borderRadius,
    this.fit = BoxFit.fill,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageComponent(
          uuid: episode.uuid,
          fit: fit,
          borderRadius: borderRadius,
          width: width,
          height: height,
        ),
        Positioned(
          top: 5,
          right: 5,
          child: ListPlatform(platforms: episode.platforms),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ColoredBox(
              color: Colors.black.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  '${Duration(seconds: episode.duration).inMinutes.toString()}min',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
