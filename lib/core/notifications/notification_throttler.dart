import 'package:application/core/constants/constant.dart';
import 'package:application/data/models/enums/config_property_key.dart';
import 'package:application/ui/viewmodels/shared_preferences_controller.dart';

/// Provides throttling for background notification-triggered server calls.
///
/// The day is divided into evenly spaced time slots based on
/// [Constant.maxServerSendsPerDay]. A call is allowed at most once per slot.
///
/// Examples:
/// - 1 (default): at most one call per day
/// - 2: up to two calls per day, spaced ~12h apart
/// - 3+: calls evenly spread over 24h
///
/// Storage:
/// - Last successful send timestamp stored as ISO 8601 in
///   [ConfigPropertyKey.lastApiCallNotification].
abstract final class NotificationThrottler {
  /// Returns true if a server call should be throttled right now, i.e.,
  /// a call has already been performed within the current time slot today.
  static bool isCallThrottled({
    final SharedPreferencesController? preferencesController,
  }) => isCallThrottledWithMax(
    Constant.maxServerSendsPerDay,
    preferencesController: preferencesController,
  );

  /// Computes whether a notification-triggered call should be throttled.
  static bool isCallThrottledWithMax(
    final int maxPerDay, {
    final DateTime? now,
    final SharedPreferencesController? preferencesController,
  }) {
    if (maxPerDay <= 0) {
      return true;
    }

    final SharedPreferencesController prefs =
        preferencesController ?? SharedPreferencesController.instance;
    final String? lastApiCallNotification = prefs.getString(
      ConfigPropertyKey.lastApiCallNotification,
    );

    if (lastApiCallNotification == null) {
      return false;
    }

    final DateTime currentTime = now ?? DateTime.now();
    final DateTime today = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
    );

    final DateTime lastCallDate;
    try {
      lastCallDate = DateTime.parse(lastApiCallNotification);
    } on FormatException {
      return false;
    }

    final DateTime lastCallDay = DateTime(
      lastCallDate.year,
      lastCallDate.month,
      lastCallDate.day,
    );

    if (!lastCallDay.isAtSameMomentAs(today)) {
      return false;
    }

    const int dayInSeconds = 24 * 60 * 60;
    final int slotLengthSec = (dayInSeconds ~/ maxPerDay).clamp(
      1,
      dayInSeconds,
    );

    final int secondsSinceMidnight = currentTime.difference(today).inSeconds;
    final int currentSlot = (secondsSinceMidnight ~/ slotLengthSec).clamp(
      0,
      maxPerDay - 1,
    );

    final int lastSecondsSinceMidnight = lastCallDate
        .difference(today)
        .inSeconds;
    final int lastSlot = lastSecondsSinceMidnight ~/ slotLengthSec;

    return lastSlot == currentSlot;
  }

  /// Records the current timestamp as the last successful notification API call.
  static Future<bool> recordCall({
    final DateTime? now,
    final SharedPreferencesController? preferencesController,
  }) async {
    final SharedPreferencesController prefs =
        preferencesController ?? SharedPreferencesController.instance;
    final DateTime timeToRecord = now ?? DateTime.now();

    return prefs.setString(
      ConfigPropertyKey.lastApiCallNotification,
      timeToRecord.toIso8601String(),
    );
  }
}
