import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';

class FollowedStreamBuilder extends StatelessWidget {
  final Widget Function(BuildContext, bool, bool) builder;
  final AnimeDto? anime;
  final EpisodeMappingDto? episode;

  const FollowedStreamBuilder({
    super.key,
    required this.builder,
    this.anime,
    this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MemberController.instance.streamController.stream,
      initialData: null,
      builder: (context, snapshot) {
        final memberDto = MemberController.instance.member;

        final containsAnime =
            anime != null && memberDto!.followedAnimes.contains(anime?.uuid);
        final containsEpisode = episode != null &&
            memberDto!.followedEpisodes.contains(episode?.uuid);

        return builder(context, containsAnime, containsEpisode);
      },
    );
  }
}
