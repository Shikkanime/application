import 'package:application/ui/components/episodes/episode_duration.dart';
import 'package:application/ui/components/image_component.dart';
import 'package:application/ui/components/platforms/platform_component.dart';
import 'package:application/data/models/enums/image_type.dart';
import 'package:application/data/models/platform_dto.dart';
import 'package:application/core/constants/constant.dart';
import 'package:flutter/material.dart';

class EpisodeImage extends StatelessWidget {
  const EpisodeImage({
    required this.uuid,
    required this.borderRadius,
    required this.platforms,
    super.key,
    this.fit = BoxFit.fill,
    this.width = double.infinity,
    this.height,
    this.placeholderHeight,
    this.duration,
  });

  final String uuid;
  final List<PlatformDto> platforms;
  final int? duration;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final double width;
  final double? height;
  final double? placeholderHeight;

  @override
  Widget build(final BuildContext context) => Stack(
    children: <Widget>[
      ImageComponent(
        uuid: uuid,
        type: ImageType.banner,
        fit: fit,
        borderRadius: borderRadius,
        width: width,
        height: height,
        placeholderHeight: placeholderHeight,
      ),
      ...PlatformComponent.toPlatformsRow(platforms),
      if (duration != null)
        Positioned(
          bottom: Constant.cornerPadding,
          right: Constant.cornerPadding,
          child: EpisodeDuration(
            duration: duration!,
            cornerPadding: Constant.cornerPadding,
          ),
        ),
    ],
  );
}
