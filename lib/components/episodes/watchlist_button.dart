import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vibration/vibration.dart';

const _bookmarkColor = Colors.yellow;

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
              color: isLiked ? _bookmarkColor : null,
            );
          },
          circleColor: const CircleColor(
            start: _bookmarkColor,
            end: _bookmarkColor,
          ),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: _bookmarkColor,
            dotSecondaryColor: _bookmarkColor,
          ),
          onTap: (isLiked) async {
            if (!isLiked) {
              if (anime != null) {
                MemberController.instance.followAnime(anime!);
              } else {
                MemberController.instance.followEpisode(episode!);
              }

              Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
            } else {
              if (anime != null) {
                MemberController.instance.unfollowAnime(anime!);
              } else {
                MemberController.instance.unfollowEpisode(episode!);
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
