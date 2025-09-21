import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlatformComponent extends StatelessWidget {
  const PlatformComponent({
    required this.platform,
    this.width = 16,
    this.height = 16,
    super.key,
  });

  final PlatformDto platform;
  final double width;
  final double height;

  @override
  Widget build(final BuildContext context) => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(360)),
    child: CachedNetworkImage(
      imageUrl: '${Constant.baseUrl}/assets/img/platforms/${platform.image}',
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (final BuildContext context, final String url) =>
          Container(color: Colors.grey, width: width, height: height),
      errorWidget:
          (final BuildContext context, final String url, final dynamic error) =>
              Container(color: Colors.grey, width: width, height: height),
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
    ),
  );

  static Iterable<Widget> toPlatformsRow(final List<PlatformDto> platforms) =>
      platforms.reversed.mapIndexed(
        (final int index, final PlatformDto platform) => Positioned(
          right: Constant.cornerPadding + index * 10,
          top: Constant.cornerPadding,
          child: PlatformComponent(platform: platform),
        ),
      );
}
