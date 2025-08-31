import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/enums/config_property_key.dart';
import 'package:application/utils/constant.dart';

/// FR: Fourni un mécanisme de limitation (throttling) des appels serveur
/// déclenchés par les notifications en arrière-plan. La journée est divisée
/// en créneaux temporels de durée égale, calculés à partir de
/// [Constant.maxServerSendsPerDay]. Un seul envoi est autorisé par créneau.
///
/// EN: Provides throttling for background notification-triggered server calls.
/// The day is divided into evenly spaced time slots based on
/// [Constant.maxServerSendsPerDay]. A call is allowed at most once per slot.
///
/// Examples / Exemples:
/// - 1 (par défaut): au plus un envoi par jour / one call per day at most
/// - 2: jusqu'à deux envois par jour, espacés d'environ 12h / up to two calls ~12h apart
/// - 3+ : envois uniformément répartis sur 24h / calls evenly spread over 24h
///
/// Storage / Stockage:
/// - Last successful send timestamp stored as ISO8601 in
///   [ConfigPropertyKey.lastApiCallNotification].
class NotificationThrottler {
  NotificationThrottler._();

  /// Returns true if a server call should be throttled right now, i.e.,
  /// a call has already been performed within the current time slot today.
  static bool isCallThrottled() =>
      isCallThrottledWithMax(Constant.maxServerSendsPerDay);

  /// Variante testable permettant d'injecter [maxPerDay] et une date [now].
  /// Identique à [isCallThrottled] lorsque [maxPerDay] vaut
  /// [Constant.maxServerSendsPerDay] et que [now] est omis.
  static bool isCallThrottledWithMax(final int maxPerDay, {DateTime? now}) {
    if (maxPerDay <= 0) {
      // Non-positive configuration disables calls entirely.
      return true;
    }

    final String? lastApiCallNotification = SharedPreferencesController.instance
        .getString(ConfigPropertyKey.lastApiCallNotification);

    now ??= DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    // Compute the slot length (in seconds) by evenly splitting the day.
    const int dayInSeconds = 24 * 60 * 60;
    final int slotLengthSec = (dayInSeconds ~/ maxPerDay).clamp(
      1,
      dayInSeconds,
    );

    final int secondsSinceMidnight = now.difference(today).inSeconds;
    final int currentSlot = (secondsSinceMidnight ~/ slotLengthSec).clamp(
      0,
      maxPerDay - 1,
    );

    if (lastApiCallNotification == null) {
      // Never called before: allow.
      return false;
    }

    final DateTime lastApiCallNotificationDate = DateTime.parse(
      lastApiCallNotification,
    );

    final DateTime lastCallDay = DateTime(
      lastApiCallNotificationDate.year,
      lastApiCallNotificationDate.month,
      lastApiCallNotificationDate.day,
    );

    if (!lastCallDay.isAtSameMomentAs(today)) {
      // Last call was on another day: allow.
      return false;
    }

    final int lastSecondsSinceMidnight = lastApiCallNotificationDate
        .difference(today)
        .inSeconds;
    final int lastSlot = lastSecondsSinceMidnight ~/ slotLengthSec;

    // Throttle if last call was performed in the same slot as now.
    return lastSlot == currentSlot;
  }
}
