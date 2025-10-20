import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

class MissedAnimeLoaderComponent extends StatelessWidget {
  const MissedAnimeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => const SizedBox(
    width: 100,
    child: Column(
      spacing: 8,
      children: <Widget>[
        GenericLoader(width: 80, height: 80, borderRadius: 360),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: GenericLoader(width: 75, height: 11),
        ),
      ],
    ),
  );
}
