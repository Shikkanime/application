import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:flutter/material.dart';

class FollowedStreamBuilder extends StatelessWidget {
  const FollowedStreamBuilder({
    required this.builder,
    super.key,
    this.anime,
    this.episode,
  });

  final Widget Function(BuildContext, bool, bool) builder;

  final AnimeDto? anime;
  final EpisodeMappingDto? episode;

  @override
  Widget build(final BuildContext context) => StreamBuilder<MemberDto>(
    stream: MemberController.instance.streamController.stream,
    initialData: MemberController.instance.member,
    builder: (
      final BuildContext context,
      final AsyncSnapshot<MemberDto> snapshot,
    ) {
      final MemberDto? memberDto = snapshot.data;

      final bool containsAnime =
          anime != null && memberDto!.followedAnimes.contains(anime?.uuid);
      final bool containsEpisode =
          episode != null &&
          memberDto!.followedEpisodes.contains(episode?.uuid);

      return builder(context, containsAnime, containsEpisode);
    },
  );
}
