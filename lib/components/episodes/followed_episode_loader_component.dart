import 'package:application/components/generic_loader.dart';
import 'package:flutter/material.dart';

double _ratio = 4;

class FollowedEpisodeLoaderComponent extends StatelessWidget {
  const FollowedEpisodeLoaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: SizedBox(
      width: 640 / _ratio + 10,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child: GenericLoader(width: double.infinity)),
          SizedBox(height: 4),
          GenericLoader(width: 90, height: 11),
          SizedBox(height: 2),
          GenericLoader(width: 75, height: 11),
        ],
      ),
    ),
  );
}
