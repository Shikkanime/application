import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constant {
  static const String apiUrl = 'http://192.168.1.71:37100/api';
  static const String baseUrl = 'http://192.168.1.71:37100';

  static const Color watchlistBookmarkColor = Colors.yellow;
  static const double borderRadius = 16;
  static const String defaultText = '＞︿＜';

  static bool get isAndroidOrIOS =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}
