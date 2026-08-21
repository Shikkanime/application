import 'package:application/core/logger/app_logger.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  const UrlLauncherService();

  static const _modes = <LaunchMode>[
    .externalNonBrowserApplication,
    .externalApplication,
    .platformDefault,
  ];

  Future<bool> launch(String url) async {
    AppLogger.print('Launch url: $url...');
    final uri = Uri.tryParse(url.trim());

    if (uri == null || !uri.hasScheme || !uri.isScheme('https')) {
      AppLogger.print('Invalid URL: $url');
      return false;
    }

    return launchUri(uri);
  }

  Future<bool> launchUri(Uri uri) async {
    if (!uri.hasScheme || !uri.isScheme('https')) {
      AppLogger.print('Invalid URI scheme: ${uri.scheme}');
      return false;
    }

    for (final mode in _modes) {
      try {
        if (await launchUrl(uri, mode: mode)) {
          return true;
        }
      } on PlatformException catch (e) {
        AppLogger.print('Failed to launch URL with mode $mode: $e');
      } catch (e) {
        AppLogger.print('Unexpected error launching URL with mode $mode: $e');
      }
    }

    return false;
  }
}
