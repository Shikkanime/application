import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

double _ratio = 4;

class FollowedAnimeLoaderComponent extends StatelessWidget {
  const FollowedAnimeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: SizedBox(
      width: 360 / _ratio + 10,
      child: const Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: GenericLoader(width: double.infinity)),
          GenericLoader(width: 90, height: 11),
        ],
      ),
    ),
  );
}
