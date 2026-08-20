import 'package:flutter/foundation.dart';

class AppLogger {
  static void print(String message) {
    final entry = '${DateTime.now().toIso8601String()} - $message';

    if (kDebugMode) {
      debugPrint(entry);
    }
  }
}
