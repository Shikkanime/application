import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchButton extends StatelessWidget {
  final String? url;
  final bool simple;

  const WatchButton({
    super.key,
    this.url,
    this.simple = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        direction: Axis.horizontal,
        children: [
          const Icon(Icons.live_tv_outlined),
          if (!simple) ...[
            const SizedBox(width: 8),
            Text(AppLocalizations.of(context)!.watch),
          ]
        ],
      ),
    );
  }
}
