import 'package:application/components/followed_stream_builder.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:vibration/vibration.dart';

class WatchlistButton extends StatelessWidget {
  final AnimeDto? anime;
  final EpisodeMappingDto? episode;
  final bool isCalendar;

  const WatchlistButton({
    super.key,
    this.anime,
    this.episode,
    this.isCalendar = false,
  });

  @override
  Widget build(BuildContext context) {
    return FollowedStreamBuilder(
      builder: (context, containsAnime, containsEpisode) {
        final isLiked = containsAnime || containsEpisode;
        return LikeButton(
          isLiked: isLiked,
          likeBuilder: _buildIcon,
          circleColor: const CircleColor(
            start: Constant.watchlistBookmarkColor,
            end: Constant.watchlistBookmarkColor,
          ),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Constant.watchlistBookmarkColor,
            dotSecondaryColor: Constant.watchlistBookmarkColor,
          ),
          onTap: _handleTap,
        );
      },
      anime: !isCalendar ? anime : null,
      episode: episode,
    );
  }

  Widget _buildIcon(bool isLiked) {
    return Icon(
      isLiked ? Icons.bookmark : Icons.bookmark_border,
      color: isLiked ? Constant.watchlistBookmarkColor : null,
    );
  }

  Future<bool> _handleTap(bool isLiked) async {
    if (!isLiked) {
      anime != null && !isCalendar
          ? MemberController.instance.followAnime(anime!)
          : MemberController.instance.followEpisode(anime, episode!);
      await Vibration.vibrate(pattern: [0, 50, 125, 50, 125, 50]);
    } else {
      anime != null
          ? MemberController.instance.unfollowAnime(anime!)
          : MemberController.instance.unfollowEpisode(episode!);
    }

    return !isLiked;
  }
}
