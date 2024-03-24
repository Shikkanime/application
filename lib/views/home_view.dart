import 'package:application/components/episode_component.dart';
import 'package:application/controllers/episode_controller.dart';
import 'package:application/dtos/episode_dto.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EpisodeDto>>(
      stream: EpisodeController.instance.streamController.stream,
      initialData: EpisodeController.instance.episodes,
      builder: (context, snapshot) {
        return ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          shrinkWrap: true,
          controller: EpisodeController.instance.scrollController,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => EpisodeComponent(
            episode: snapshot.data![index],
          ),
        );
      },
    );
  }
}
