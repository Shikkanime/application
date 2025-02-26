import 'package:application/components/animes/missed/missed_anime_component.dart';
import 'package:application/components/card_component.dart';
import 'package:application/controllers/animes/missed_anime_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MissedAnimesRow extends StatelessWidget {
  const MissedAnimesRow({super.key});

  @override
  Widget build(final BuildContext context) =>
      StreamBuilder<List<MissedAnimeDto>>(
        stream: MissedAnimeController.instance.streamController.stream,
        initialData: MissedAnimeController.instance.items,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<MissedAnimeDto>> snapshot,
        ) {
          if (snapshot.data!.isEmpty) {
            return const SizedBox.shrink();
          }

          return CustomCard(
            margin: 12,
            child: Scrollbar(
              controller: MissedAnimeController.instance.scrollController,
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.whatYouMightHaveMissed1,
                      ),
                      Text(
                        AppLocalizations.of(context)!.whatYouMightHaveMissed2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 105,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            controller:
                                MissedAnimeController.instance.scrollController,
                            itemCount: snapshot.data!.length,
                            itemBuilder:
                                (final BuildContext context, final int index) =>
                                    MissedAnimeComponent(
                                      missedAnime: snapshot.data![index],
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
