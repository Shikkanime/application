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
class NotificationThrottler {
  NotificationThrottler._();

  static const _dayInSeconds = 86400;

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

    final prefs = preferencesController ?? SharedPreferencesController.instance;
    final lastCallDate = _getLastCallDate(prefs);

    if (lastCallDate == null) {
      // No call recorded or invalid timestamp format: allow call.
      return false;
    }

    final currentTime = now ?? DateTime.now();
    final today = _truncateToDay(currentTime);

    if (!_isSameDay(lastCallDate, today)) {
      // Last call was on another day: allow call.
      return false;
    }

    // Divide 24 hours into equal time slots based on maxPerDay.
    final slotDuration = (_dayInSeconds ~/ maxPerDay).clamp(1, _dayInSeconds);

    // Compare current slot index against the slot index of the last call.
    return _computeSlot(currentTime, today, slotDuration, maxPerDay) ==
        _computeSlot(lastCallDate, today, slotDuration, maxPerDay);
  }

  /// Retrieves and parses the last notification call timestamp from [prefs].
  static DateTime? _getLastCallDate(final SharedPreferencesController prefs) {
    final rawTimestamp = prefs.getString(
      ConfigPropertyKey.lastApiCallNotification,
    );
    return rawTimestamp != null ? _parseIsoDate(rawTimestamp) : null;
  }

  /// Truncates a [DateTime] to 00:00:00 of the same calendar day.
  static DateTime _truncateToDay(final DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day);

  /// Returns true if [lastCallDate] occurred on the same calendar day as [today].
  static bool _isSameDay(final DateTime lastCallDate, final DateTime today) =>
      _truncateToDay(lastCallDate).isAtSameMomentAs(today);

  /// Calculates the zero-based time slot index for a given [time] on [today].
  static int _computeSlot(
    final DateTime time,
    final DateTime today,
    final int slotDurationSeconds,
    final int maxSlots,
  ) {
    // Slot index = elapsed seconds from midnight divided by slot duration, clamped to [0, maxSlots - 1].
    return (time.difference(today).inSeconds ~/ slotDurationSeconds).clamp(
      0,
      maxSlots - 1,
    );
  }

  /// Safely parses an ISO 8601 date string, returning null if invalid.
  static DateTime? _parseIsoDate(final String rawDate) {
    try {
      return DateTime.parse(rawDate);
    } on FormatException {
      return null;
    }
  }

  /// Records the current timestamp as the last successful notification API call.
  static Future<bool> recordCall({
    final DateTime? now,
    final SharedPreferencesController? preferencesController,
  }) async {
    final prefs = preferencesController ?? SharedPreferencesController.instance;
    final timeToRecord = now ?? DateTime.now();

    return prefs.setString(
      ConfigPropertyKey.lastApiCallNotification,
      timeToRecord.toIso8601String(),
    );
  }
}
