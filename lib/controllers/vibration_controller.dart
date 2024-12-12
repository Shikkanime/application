import 'dart:async';

import 'package:application/utils/constant.dart';
import 'package:vibration/vibration.dart';

class VibrationController {
  static final VibrationController instance = VibrationController();

  void vibrate({
    final int duration = 500,
    final List<int> pattern = const <int>[],
    final int repeat = -1,
    final List<int> intensities = const <int>[],
    final int amplitude = -1,
  }) {
    if (Constant.isAndroidOrIOS) {
      unawaited(
        Vibration.vibrate(
          duration: duration,
          pattern: pattern,
          repeat: repeat,
          intensities: intensities,
          amplitude: amplitude,
        ),
      );
    }
  }
}
