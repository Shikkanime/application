import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constant {
  static const String apiUrl = 'https://api.shikkanime.fr';
  static const String baseUrl = 'https://www.shikkanime.fr';

  static const Color watchlistBookmarkColor = Colors.yellow;
  static const double borderRadius = 16;
  static const String defaultText = '＞︿＜';
  static const double cornerPadding = 7.5;

  /// Nombre maximum d'envois au serveur par jour déclenchés via notifications.
  ///
  /// 1 = au plus un envoi par jour (par défaut)
  /// 2 = au plus deux envois par jour, espacés d'environ 12 heures
  /// 3 ou plus = envois répartis uniformément sur 24h
  static const int maxServerSendsPerDay = 2;

  static bool get isAndroidOrIOS =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}
