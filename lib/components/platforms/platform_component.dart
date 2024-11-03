import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlatformComponent extends StatelessWidget {
  const PlatformComponent({required this.platform, super.key});

  final PlatformDto platform;

  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(360)),
        child: CachedNetworkImage(
          imageUrl:
              '${Constant.baseUrl}/assets/img/platforms/${platform.image}',
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          width: 24,
          height: 24,
          placeholder: (final BuildContext context, final String url) =>
              Container(
            color: Colors.grey,
            width: 24,
            height: 24,
          ),
        ),
      );
}
