import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchButton extends StatelessWidget {
  const WatchButton({
    super.key,
    this.url,
    this.simple = false,
  });

  final String? url;
  final bool simple;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
        style: Theme.of(context).getCardButtonStyle(),
        onPressed: () {
          if (url == null || url!.isEmpty) {
            return;
          }

          launchUrl(
            Uri.parse(url!),
            mode: LaunchMode.externalNonBrowserApplication,
          );
        },
        child: Flex(
          spacing: 8,
          direction: Axis.horizontal,
          children: <Widget>[
            const Icon(Icons.live_tv_outlined),
            if (!simple) Text(AppLocalizations.of(context)!.watch),
          ],
        ),
      );
}
