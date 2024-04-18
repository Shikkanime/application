import 'package:application/components/platform_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        ClipRRect(
          borderRadius: borderRadius,
          child: CachedNetworkImage(
            imageUrl:
                '${Constant.apiUrl}/v1/attachments?uuid=${episode.uuid}&type=image',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            width: width,
            height: height,
            placeholder: (context, url) => Container(
              color: Colors.grey,
              width: width,
              height: height,
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              for (final platform in episode.platforms)
                PlatformComponent(platform: platform),
            ],
          ),
        ),
      ],
    );
  }
}
