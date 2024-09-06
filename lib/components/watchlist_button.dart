import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/missed_anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vibration/vibration.dart';

class WatchlistButton extends StatelessWidget {
  final EpisodeMappingDto? episode;
  final AnimeDto? anime;

  const WatchlistButton({
    super.key,
    this.episode,
    this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return FollowedStreamBuilder(
      builder: (context, containsAnime, containsEpisode) {
        return LikeButton(
          isLiked: containsAnime || containsEpisode,
          likeBuilder: (isLiked) {
            return Icon(
              isLiked ? Icons.bookmark : Icons.bookmark_border,
              color: isLiked ? Constant.watchlistBookmarkColor : null,
            );
          },
          circleColor: const CircleColor(
            start: Constant.watchlistBookmarkColor,
            end: Constant.watchlistBookmarkColor,
          ),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Constant.watchlistBookmarkColor,
            dotSecondaryColor: Constant.watchlistBookmarkColor,
          ),
          onTap: (isLiked) async {
            if (!isLiked) {
              if (anime != null) {
                MemberController.instance
                    .followAnime(anime!)
                    .then((value) => MissedAnimeController.instance.init());
              } else {
                MemberController.instance
                    .followEpisode(episode!)
                    .then((value) => MissedAnimeController.instance.init());
              }

              Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
            } else {
              if (anime != null) {
                MemberController.instance
                    .unfollowAnime(anime!)
                    .then((value) => MissedAnimeController.instance.init());
              } else {
                MemberController.instance
                    .unfollowEpisode(episode!)
                    .then((value) => MissedAnimeController.instance.init());
              }
            }

            return !isLiked;
          },
        );
      },
      anime: anime,
      episode: episode,
    );
  }
}
