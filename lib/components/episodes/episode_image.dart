import 'dart:ui';

import 'package:application/components/platform_component.dart';
import 'package:application/dtos/episode_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EpisodeImage extends StatelessWidget {
  final EpisodeDto episode;
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
        SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: borderRadius,
                child: CachedNetworkImage(
                  imageUrl:
                      '${Constant.apiUrl}/v1/attachments?uuid=${episode.uuid}&type=image',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Container(
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                ),
              ),
              if (episode.uncensored)
                ClipRRect(
                  borderRadius: borderRadius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: PlatformComponent(platform: episode.platform),
        ),
      ],
    );
  }
}
