import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlatformComponent extends StatelessWidget {
  final PlatformDto platform;

  const PlatformComponent({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: CachedNetworkImage(
        imageUrl: '${Constant.baseUrl}/assets/img/platforms/${platform.image}',
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        width: 24,
        height: 24,
        placeholder: (context, url) => Container(
          color: Colors.grey,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
