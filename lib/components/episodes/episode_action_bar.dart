import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';

class EpisodeActionBar extends StatelessWidget {
  final EpisodeMappingDto episode;

  const EpisodeActionBar({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        WatchlistButton(episode: episode),
        const SizedBox(width: 8),
        WatchButton(url: episode.variants?.first.url),
      ],
    );
  }
}
