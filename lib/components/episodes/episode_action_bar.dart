import 'package:application/components/watch_button.dart';
import 'package:application/components/watchlist_button.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class EpisodeActionBar extends StatelessWidget {
  const EpisodeActionBar({
    required this.url,
    super.key,
    this.anime,
    this.episode,
    this.simple = false,
    this.showWatchlist = true,
  });

  final String? anime;
  final String? episode;
  final String url;
  final bool simple;
  final bool showWatchlist;

  @override
  Widget build(final BuildContext context) => Flex(
    spacing: 8,
    direction: Axis.horizontal,
    children: <Widget>[
      if (showWatchlist)
        WatchlistButton(
          anime: anime,
          episode: episode,
          isEpisode: true,
          simple: simple,
          style: Theme.of(context).getCardButtonStyle(),
        ),
      WatchButton(url: url, simple: simple),
    ],
  );
}
