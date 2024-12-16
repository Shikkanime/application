import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class EpisodeDuration extends StatelessWidget {
  const EpisodeDuration({
    required this.episode,
    required this.cornerPadding,
    super.key,
  });

  final EpisodeMappingDto episode;
  final double cornerPadding;

  String _duration(final Duration duration) => <String>[
        if (duration.inHours > 0) '${duration.inHours}',
        duration.inMinutes
            .remainder(60)
            .toString()
            .padLeft(duration.inHours > 0 ? 2 : 1, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
      ].join(':');

  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(Constant.borderRadius - cornerPadding),
        ),
        child: ColoredBox(
          color: Colors.black.withValues(alpha: 0.5),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              _duration(Duration(seconds: episode.duration)),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ),
      );
}
