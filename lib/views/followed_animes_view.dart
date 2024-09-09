import 'package:application/components/animes/anime_component.dart';
import 'package:application/controllers/followed_anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowedAnimesView extends StatefulWidget {
  const FollowedAnimesView({super.key});

  @override
  State<FollowedAnimesView> createState() => _FollowedAnimesViewState();
}

class _FollowedAnimesViewState extends State<FollowedAnimesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    FollowedAnimeController.instance.dispose();
    super.dispose();
  }

  List<Widget> _buildAnimeList(List<AnimeDto> animes) {
    final widgets = <Widget>[];

    for (int i = 0; i < animes.length; i += 2) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: AnimeComponent(anime: animes[i])),
            if (i + 1 < animes.length)
              Expanded(child: AnimeComponent(anime: animes[i + 1]))
            else
              const Spacer(),
          ],
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0, title: Text(AppLocalizations.of(context)!.watchlist)),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: StreamBuilder<List<AnimeDto>>(
          stream: FollowedAnimeController.instance.streamController.stream,
          initialData: FollowedAnimeController.instance.animes,
          builder: (context, snapshot) {
            final list = _buildAnimeList(snapshot.data!);

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
