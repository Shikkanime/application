import 'package:application/components/elevated_async_button.dart';
import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/l10n/generated/app_localizations.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class WatchlistButton extends StatelessWidget {
  const WatchlistButton({
    super.key,
    this.anime,
    this.episode,
    this.isCalendar = false,
    this.simple = false,
    this.style,
  });

  final AnimeDto? anime;
  final EpisodeMappingDto? episode;
  final bool isCalendar;
  final bool simple;
  final ButtonStyle? style;

  @override
  Widget build(final BuildContext context) => FollowedStreamBuilder(
        builder: (
          final BuildContext content,
          final bool animeInWatchlist,
          final bool episodeInWatchlist,
        ) {
          final bool isLiked = animeInWatchlist || episodeInWatchlist;

          return ElevatedAsyncButton(
            style: style,
            onPressed: () async {
              if (!isLiked) {
                anime != null && !isCalendar
                    ? await MemberController.instance.followAnime(anime!)
                    : await MemberController.instance
                        .followEpisode(anime, episode!);

                VibrationController.instance
                    .vibrate(pattern: <int>[0, 50, 125, 50, 125, 50]);
              } else {
                anime != null && !isCalendar
                    ? await MemberController.instance.unfollowAnime(anime!)
                    : await MemberController.instance.unfollowEpisode(episode!);
              }
            },
            child: Flex(
              spacing: 8,
              direction: Axis.horizontal,
              children: <Widget>[
                Icon(
                  isLiked ? Icons.bookmark : Icons.bookmark_border,
                  color: isLiked ? Constant.watchlistBookmarkColor : null,
                ),
                if (!simple) Text(AppLocalizations.of(context)!.watchlist),
              ],
            ),
          );
        },
        anime: !isCalendar ? anime : null,
        episode: episode,
      );
}
