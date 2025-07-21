import 'package:application/components/elevated_async_button.dart';
import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';

class WatchlistButton extends StatelessWidget {
  const WatchlistButton({
    super.key,
    this.anime,
    this.episode,
    this.isAnime = false,
    this.isEpisode = false,
    this.inWatchlist = false,
    this.simple = false,
    this.style,
    this.onFollowed,
  });

  final String? anime;
  final String? episode;
  final bool isAnime;
  final bool isEpisode;
  final bool inWatchlist;
  final bool simple;
  final ButtonStyle? style;
  final void Function(bool)? onFollowed;

  @override
  Widget build(final BuildContext context) => FollowedStreamBuilder(
    builder:
        (
          final BuildContext content,
          final bool animeInWatchlist,
          final bool episodeInWatchlist,
        ) {
          final bool isLiked =
              (isAnime && (animeInWatchlist || inWatchlist)) ||
              (isEpisode && (episodeInWatchlist || inWatchlist));

          return ElevatedAsyncButton(
            style: style,
            onPressed: () async {
              if (!isLiked) {
                await _followContent();
                VibrationController.instance.vibrate(
                  pattern: <int>[0, 50, 125, 50, 125, 50],
                );
              } else {
                await _unfollowContent();
              }

              onFollowed?.call(!isLiked);
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
    anime: anime,
    episode: episode,
  );

  Future<void> _followContent() async {
    if (isAnime && anime != null) {
      await MemberController.instance.followAnime(anime!);
    }

    if (isEpisode && anime != null && episode != null) {
      await MemberController.instance.followEpisode(anime!, episode!);
    }
  }

  Future<void> _unfollowContent() async {
    if (isAnime && anime != null) {
      await MemberController.instance.unfollowAnime(anime!);
    }

    if (isEpisode && episode != null) {
      await MemberController.instance.unfollowEpisode(episode!);
    }
  }
}
