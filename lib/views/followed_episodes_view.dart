import 'package:application/components/episodes/episode_component.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowedEpisodesView extends StatefulWidget {
  const FollowedEpisodesView({super.key});

  @override
  State<FollowedEpisodesView> createState() => _FollowedEpisodesViewState();
}

class _FollowedEpisodesViewState extends State<FollowedEpisodesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    FollowedEpisodeController.instance.init();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.watchlist),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StreamBuilder<List<EpisodeMappingDto>>(
          stream: FollowedEpisodeController.instance.streamController.stream,
          initialData: FollowedEpisodeController.instance.episodes,
          builder: (context, snapshot) {
            return ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              shrinkWrap: true,
              controller: FollowedEpisodeController.instance.scrollController,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  EpisodeComponent(episode: snapshot.data![index]),
            );
          },
        ),
      ),
    );
  }
}
