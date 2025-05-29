import 'package:application/components/animes/followed_anime_component.dart';
import 'package:application/components/card_component.dart';
import 'package:application/controllers/animes/followed_anime_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FollowedAnimesRow extends StatelessWidget {
  const FollowedAnimesRow({super.key});

  @override
  Widget build(final BuildContext context) => CustomCard(
    padding: false,
    child: Scrollbar(
      controller: FollowedAnimeController.instance.scrollController,
      child: StreamBuilder<List<AnimeDto>>(
        stream: FollowedAnimeController.instance.streamController.stream,
        initialData: FollowedAnimeController.instance.items,
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<List<AnimeDto>> snapshot,
            ) => Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.yourRecentlyAddedAnime1),
                    Text(
                      AppLocalizations.of(context)!.yourRecentlyAddedAnime2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (snapshot.data!.isEmpty)
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.noFollowedAnime,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 175,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            itemCount: snapshot.data!.length,
                            controller:
                                FollowedAnimeController
                                    .instance
                                    .scrollController,
                            itemBuilder:
                                (final BuildContext context, final int index) =>
                                    FollowedAnimeComponent(
                                      anime: snapshot.data![index],
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
      ),
    ),
  );
}
