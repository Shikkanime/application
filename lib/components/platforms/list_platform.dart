import 'package:application/components/platforms/platform_component.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:flutter/material.dart';

class ListPlatform extends StatelessWidget {
  final List<PlatformDto> platforms;

  const ListPlatform({super.key, required this.platforms});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        for (final platform in platforms)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: PlatformComponent(platform: platform),
          ),
      ],
    );
  }
}
