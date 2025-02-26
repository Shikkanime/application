import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class EpisodeActionBar extends StatelessWidget {
  const EpisodeActionBar({
    required this.episode,
    super.key,
    this.simple = false,
    this.showWatchlist = true,
  });

  final EpisodeMappingDto episode;
  final bool simple;
  final bool showWatchlist;

  @override
  Widget build(final BuildContext context) => Flex(
    spacing: 8,
    direction: Axis.horizontal,
    children: <Widget>[
      if (showWatchlist)
        WatchlistButton(
          episode: episode,
          simple: simple,
          style: Theme.of(context).getCardButtonStyle(),
        ),
      WatchButton(url: episode.variants?.first.url, simple: simple),
    ],
  );
}
