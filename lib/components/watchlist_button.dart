import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

class WatchlistButton extends StatelessWidget {
  final AnimeDto? anime;
  final EpisodeMappingDto? episode;
  final bool isCalendar;
  final bool simple;

  const WatchlistButton({
    super.key,
    this.anime,
    this.episode,
    this.isCalendar = false,
    this.simple = false,
  });

  @override
  Widget build(BuildContext context) {
    return FollowedStreamBuilder(
      builder: (context, containsAnime, containsEpisode) {
        final isLiked = containsAnime || containsEpisode;

        return ElevatedButton(
          onPressed: () async {
            if (!isLiked) {
              anime != null && !isCalendar
                  ? MemberController.instance.followAnime(anime!)
                  : MemberController.instance.followEpisode(anime, episode!);
              await Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
            } else {
              anime != null && !isCalendar
                  ? MemberController.instance.unfollowAnime(anime!)
                  : MemberController.instance.unfollowEpisode(episode!);
            }
          },
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Icon(
                isLiked ? Icons.bookmark : Icons.bookmark_border,
                color: isLiked ? Constant.watchlistBookmarkColor : null,
              ),
              if (!simple) ...[
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
}
