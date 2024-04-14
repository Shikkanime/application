import 'package:application/components/episodes/watchlist_button.dart';
import 'package:application/dtos/episode_dto.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeActionBar extends StatelessWidget {
  final EpisodeDto episode;

  const EpisodeActionBar({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              launchUrl(
                Uri.parse(episode.url),
                mode: LaunchMode.externalNonBrowserApplication,
              );
            },
            child: const Icon(
              Icons.live_tv_outlined,
            ),
          ),
        ),
        const WatchlistButton(),
      ],
    );
  }
}
