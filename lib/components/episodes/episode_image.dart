import 'package:application/components/image_component.dart';
import 'package:application/components/platforms/platform_component.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
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
            fit: fit,
            borderRadius: borderRadius,
            width: width,
            height: height,
          ),
          if (episode.platforms != null && episode.platforms!.isNotEmpty)
            for (final PlatformDto platform in episode.platforms!)
              Positioned(
                right: 7.5 + episode.platforms!.indexOf(platform) * 15,
                top: 7.5,
                child: PlatformComponent(platform: platform),
              ),
          if (showDuration)
            Positioned(
              bottom: 7.5,
              right: 7.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constant.borderRadius),
                ),
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      _duration(Duration(seconds: episode.duration)),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      );

  String _duration(final Duration duration) {
    final List<String> parts = <String>[];

    if (duration.inHours > 0) {
      parts.add('${duration.inHours}');
    }

    parts
      ..add(duration.inMinutes.remainder(60).toString())
      ..add(duration.inSeconds.remainder(60).toString().padLeft(2, '0'));

    return parts.join(':');
  }
}
