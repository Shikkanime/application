import 'dart:async';

import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

class WatchlistButton extends StatelessWidget {
  const WatchlistButton({
    super.key,
    this.anime,
    this.episode,
    this.isCalendar = false,
    this.simple = false,
  });

  final AnimeDto? anime;
  final EpisodeMappingDto? episode;
  final bool isCalendar;
  final bool simple;

  @override
  Widget build(final BuildContext context) => FollowedStreamBuilder(
        builder: (
          final BuildContext content,
          final bool animeInWatchlist,
          final bool episodeInWatchlist,
        ) {
          final bool isLiked = animeInWatchlist || episodeInWatchlist;

          return ElevatedButton(
            onPressed: () async {
              if (!isLiked) {
                anime != null && !isCalendar
                    ? await MemberController.instance.followAnime(anime!)
                    : await MemberController.instance
                        .followEpisode(anime, episode!);

                if (Constant.isAndroidOrIOS) {
                  unawaited(
                    Vibration.vibrate(
                      pattern: <int>[0, 50, 125, 50, 125, 50],
                    ),
                  );
                }
              } else {
                anime != null && !isCalendar
                    ? await MemberController.instance.unfollowAnime(anime!)
                    : await MemberController.instance.unfollowEpisode(episode!);
              }
            },
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Icon(
                  isLiked ? Icons.bookmark : Icons.bookmark_border,
                  color: isLiked ? Constant.watchlistBookmarkColor : null,
                ),
                if (!simple) ...<Widget>[
                  const SizedBox(width: 8),
                  Text(AppLocalizations.of(context)!.watchlist),
                ],
              ],
            ),
          );
        },
        anime: !isCalendar ? anime : null,
        episode: episode,
      );
}
