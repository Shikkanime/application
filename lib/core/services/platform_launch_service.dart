import 'package:application/core/logger/app_logger.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformLaunchService {
  const PlatformLaunchService();

  static const _modes = <LaunchMode>[
    .externalNonBrowserApplication,
    .externalApplication,
    .platformDefault,
  ];

  Future<bool> launch(String rawUrl) async {
    final Uri? uri = Uri.tryParse(rawUrl);

    if (uri == null || !uri.isScheme('https')) {
      AppLogger.print('Invalid URL: $rawUrl');
      return false;
    }

    for (final mode in _modes) {
      try {
        if (await launchUrl(uri, mode: mode)) {
          return true;
        }
      } on PlatformException catch (e) {
        AppLogger.print('Failed to launch URL with mode $mode: $e');
      }
    }

    return false;
  }
}
