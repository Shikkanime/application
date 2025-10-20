import 'package:application/components/card_component.dart';
import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

class AnimeEpisodeLoaderComponent extends StatelessWidget {
  const AnimeEpisodeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => const CustomCard(
    child: SizedBox(
      height: 170,
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: GenericLoader(height: double.infinity)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GenericLoader(width: 200, height: 20),
                SizedBox(height: 8),
                GenericLoader(width: 150, height: 15),
                SizedBox(height: 8),
                GenericLoader(width: 100, height: 15),
                Spacer(),
                Row(
                  children: <Widget>[
                    GenericLoader(width: 75, height: 25),
                    SizedBox(width: 8),
                    GenericLoader(width: 75, height: 25),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
