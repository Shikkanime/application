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
    final DateTime? lastCallDate = _getLastCallDate(prefs);

    if (lastCallDate == null) {
      // No call recorded or invalid timestamp format: allow call.
      return false;
    }

    final DateTime currentTime = now ?? DateTime.now();
    final DateTime today = _truncateToDay(currentTime);

    if (!_isSameDay(lastCallDate, today)) {
      // Last call was on another day: allow call.
      return false;
    }

    // Divide 24 hours into equal time slots based on maxPerDay.
    const int dayInSeconds = 86400;
    final int slotDuration = (dayInSeconds ~/ maxPerDay).clamp(1, dayInSeconds);

    // Compare current slot index against the slot index of the last call.
    final int currentSlot = _computeSlot(
      currentTime,
      today,
      slotDuration,
      maxPerDay,
    );
    final int lastSlot = _computeSlot(
      lastCallDate,
      today,
      slotDuration,
      maxPerDay,
    );

    return currentSlot == lastSlot;
  }

  /// Retrieves and parses the last notification call timestamp from [prefs].
  static DateTime? _getLastCallDate(final SharedPreferencesController prefs) {
    final String? rawTimestamp = prefs.getString(
      ConfigPropertyKey.lastApiCallNotification,
    );
    return rawTimestamp == null ? null : _parseIsoDate(rawTimestamp);
  }

  /// Truncates a [DateTime] to 00:00:00 of the same calendar day.
  static DateTime _truncateToDay(final DateTime dt) =>
      DateTime(dt.year, dt.month, dt.day);

  /// Returns true if [lastCallDate] occurred on the same calendar day as [today].
  static bool _isSameDay(final DateTime lastCallDate, final DateTime today) {
    final DateTime lastCallDay = _truncateToDay(lastCallDate);
    return lastCallDay.isAtSameMomentAs(today);
  }

  /// Calculates the zero-based time slot index for a given [time] on [today].
  static int _computeSlot(
    final DateTime time,
    final DateTime today,
    final int slotDurationSeconds,
    final int maxSlots,
  ) {
    // Number of elapsed seconds from 00:00:00 midnight today.
    final int secondsSinceMidnight = time.difference(today).inSeconds;

    // Slot index = elapsed seconds divided by slot duration, clamped to [0, maxSlots - 1].
    return (secondsSinceMidnight ~/ slotDurationSeconds).clamp(0, maxSlots - 1);
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
    final SharedPreferencesController prefs =
        preferencesController ?? SharedPreferencesController.instance;
    final DateTime timeToRecord = now ?? DateTime.now();

    return prefs.setString(
      ConfigPropertyKey.lastApiCallNotification,
      timeToRecord.toIso8601String(),
    );
  }
}
