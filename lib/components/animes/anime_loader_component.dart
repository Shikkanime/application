import 'package:application/components/card_component.dart';
import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

class AnimeLoaderComponent extends StatelessWidget {
  const AnimeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => const CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 280,
              child: GenericLoader(),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 200,
              height: 20,
              child: GenericLoader(),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 100,
              height: 15,
              child: GenericLoader(),
            ),
            SizedBox(height: 14),
            SizedBox(
              width: 125,
              height: 25,
              child: GenericLoader(),
            ),
          ],
        ),
      );
}
