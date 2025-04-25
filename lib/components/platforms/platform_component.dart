import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlatformComponent extends StatelessWidget {
  const PlatformComponent({required this.platform, super.key});

  final PlatformDto platform;

  @override
  Widget build(final BuildContext context) => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(360)),
    child: CachedNetworkImage(
      imageUrl: '${Constant.baseUrl}/assets/img/platforms/${platform.image}',
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
      width: 16,
      height: 16,
      placeholder:
          (final BuildContext context, final String url) =>
              Container(color: Colors.grey, width: 16, height: 16),
      errorWidget:
          (final BuildContext context, final String url, final dynamic error) =>
              Container(color: Colors.grey, width: 16, height: 16),
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
