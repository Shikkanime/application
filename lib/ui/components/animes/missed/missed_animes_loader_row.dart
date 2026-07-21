import 'package:application/ui/components/animes/missed/missed_anime_loader_component.dart';
import 'package:application/ui/components/card_component.dart';
import 'package:application/ui/components/generic_loader.dart';
import 'package:application/ui/viewmodels/animes/missed_anime_controller.dart';
import 'package:flutter/material.dart';

class MissedAnimesLoaderRow extends StatelessWidget {
  const MissedAnimesLoaderRow({super.key});

  @override
  Widget build(final BuildContext context) => CustomCard(
    child: Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const GenericLoader(width: 150, height: 14),
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
                  itemCount: MissedAnimeController.instance.limit,
                  itemBuilder: (final BuildContext context, final int index) =>
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
