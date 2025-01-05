import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constant {
  static const String apiUrl = 'https://api.shikkanime.fr';
  static const String baseUrl = 'https://www.shikkanime.fr';

  static const Color watchlistBookmarkColor = Colors.yellow;
  static const double borderRadius = 16;
  static const String defaultText = '＞︿＜';
  static const double cornerPadding = 7.5;

  static bool get isAndroidOrIOS =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}
