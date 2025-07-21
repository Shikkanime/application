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
    this.showWatchlistButton = true,
    this.inWatchlist = false,
    this.onFollowed,
  });

  final String? anime;
  final String? episode;
  final String url;
  final bool simple;
  final bool showWatchlistButton;
  final bool inWatchlist;
  final void Function(bool)? onFollowed;

  @override
  Widget build(final BuildContext context) => Flex(
    spacing: 8,
    direction: Axis.horizontal,
    children: <Widget>[
      if (showWatchlistButton)
        WatchlistButton(
          anime: anime,
          episode: episode,
          isEpisode: true,
          inWatchlist: inWatchlist,
          simple: simple,
          style: Theme.of(context).cardButtonStyle,
          onFollowed: onFollowed,
        ),
      WatchButton(url: url, simple: simple),
    ],
  );
}
