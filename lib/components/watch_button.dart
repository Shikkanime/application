import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchButton extends StatelessWidget {
  final String? url;

  const WatchButton({
    super.key,
    this.url,
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
      child: const Flex(
        direction: Axis.horizontal,
        children: [
          Icon(Icons.live_tv_outlined),
          SizedBox(width: 8),
          Text('Regarder'),
        ],
      ),
    );
  }
}
