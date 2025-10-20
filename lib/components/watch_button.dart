import 'package:application/controllers/platforms_controller.dart';
import 'package:application/dtos/episode_source_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class WatchButton extends StatelessWidget {
  const WatchButton({required this.sources, super.key, this.simple = false});

  final List<EpisodeSourceDto> sources;
  final bool simple;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    style: Theme.of(context).cardButtonStyle,
    onPressed: () => PlatformsController.instance.handleWatch(context, sources),
    child: Flex(
      spacing: 8,
      direction: Axis.horizontal,
      children: <Widget>[
        const Icon(Icons.live_tv_outlined),
        if (!simple) Text(AppLocalizations.of(context)!.play),
      ],
    ),
  );
}
