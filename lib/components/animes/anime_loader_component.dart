import 'package:application/components/card_component.dart';
import 'package:application/components/generic_loader.dart';
import 'package:application/controllers/animes/anime_controller.dart';
import 'package:flutter/material.dart';

class AnimeLoaderComponent extends StatelessWidget {
  const AnimeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => CustomCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: AnimeController.instance.placeholderHeight(context),
          child: const GenericLoader(),
        ),
        const SizedBox(height: 16),
        const SizedBox(width: 200, height: 20, child: GenericLoader()),
        const SizedBox(height: 8),
        const SizedBox(width: 100, height: 15, child: GenericLoader()),
        const SizedBox(height: 14),
        const SizedBox(width: 125, height: 25, child: GenericLoader()),
      ],
    ),
  );
}
