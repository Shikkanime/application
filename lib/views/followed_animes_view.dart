import 'dart:math';

import 'package:application/components/animes/anime_component.dart';
import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowedAnimesView extends StatefulWidget {
  const FollowedAnimesView({super.key});

  @override
  State<FollowedAnimesView> createState() => _FollowedAnimesViewState();
}

class _FollowedAnimesViewState extends State<FollowedAnimesView> {
  @override
  void dispose() {
    FollowedAnimeController.instance.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimeList(BuildContext context, List<AnimeDto> animes) {
    final smallestDimension = MediaQuery.of(context).size.width;

    return wb.WidgetBuilder.instance.buildRowWidgets(
      animes.map((anime) => AnimeComponent(anime: anime)),
      maxElementsPerRow: max(2, (smallestDimension * 3 / 600).floor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.watchlist),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StreamBuilder<List<AnimeDto>>(
          stream: FollowedAnimeController.instance.streamController.stream,
          initialData: FollowedAnimeController.instance.items,
          builder: (context, snapshot) {
            final list = _buildAnimeList(context, snapshot.data!);

            return ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              controller: FollowedAnimeController.instance.scrollController,
              itemCount: list.length,
              itemBuilder: (context, index) => list[index],
            );
          },
        ),
      ),
    );
  }
}
