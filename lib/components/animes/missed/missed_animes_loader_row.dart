import 'package:application/components/animes/missed/missed_anime_loader_component.dart';
import 'package:application/components/card_component.dart';
import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

class MissedAnimesLoaderRow extends StatelessWidget {
  const MissedAnimesLoaderRow({super.key});

  @override
  Widget build(final BuildContext context) => CustomCard(
        margin: 12,
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 150,
              height: 14,
              child: GenericLoader(),
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
                      itemCount: 12,
                      itemBuilder: (
                        final BuildContext context,
                        final int index,
                      ) =>
                          const MissedAnimeLoaderComponent(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
