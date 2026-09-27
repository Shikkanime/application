import 'package:flutter/services.dart';
import 'package:url_launcher_platform_interface/link.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class ThrowingUrlLauncherPlatform extends UrlLauncherPlatform {
  final List<(String, PreferredLaunchMode)> calls = [];

  @override
  LinkDelegate? get linkDelegate => null;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    calls.add((url, options.mode));

    throw PlatformException(code: 'platform_error');
  }
}
