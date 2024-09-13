import 'dart:math';

import 'package:application/components/episodes/episode_component.dart';
import 'package:application/controllers/followed_episode_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowedEpisodesView extends StatefulWidget {
  const FollowedEpisodesView({super.key});

  @override
  State<FollowedEpisodesView> createState() => _FollowedEpisodesViewState();
}

class _FollowedEpisodesViewState extends State<FollowedEpisodesView> {
  @override
  void dispose() {
    FollowedEpisodeController.instance.dispose();
    super.dispose();
  }

  List<Widget> _buildEpisodeList(
    BuildContext context,
    List<EpisodeMappingDto> episodes,
  ) {
    final smallestDimension = MediaQuery.of(context).size.width;

    return wb.WidgetBuilder.instance.buildRowWidgets(
      episodes.map((episode) => EpisodeComponent(episode: episode)),
      maxElementsPerRow: max(1, (smallestDimension * 2 / 600).floor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.watchlist),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StreamBuilder<List<EpisodeMappingDto>>(
          stream: FollowedEpisodeController.instance.streamController.stream,
          initialData: FollowedEpisodeController.instance.items,
          builder: (context, snapshot) {
            final list = _buildEpisodeList(context, snapshot.data!);

            return ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              controller: FollowedEpisodeController.instance.scrollController,
              itemCount: list.length,
              itemBuilder: (context, index) => list[index],
            );
          },
        ),
      ),
    );
  }
}
