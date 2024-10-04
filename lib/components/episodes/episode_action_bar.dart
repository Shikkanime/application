import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';

class EpisodeActionBar extends StatelessWidget {
  final EpisodeMappingDto episode;
  final bool simple;
  final bool showWatchlist;

  const EpisodeActionBar({
    super.key,
    required this.episode,
    this.simple = false,
    this.showWatchlist = true,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        if (showWatchlist) ...[
          WatchlistButton(
            episode: episode,
            simple: simple,
          ),
          const SizedBox(width: 8),
        ],
        WatchButton(
          url: episode.variants?.first.url,
          simple: simple,
        ),
      ],
    );
  }
}
