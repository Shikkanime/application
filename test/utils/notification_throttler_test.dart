import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/enums/config_property_key.dart';
import 'package:application/utils/notification_throttler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await SharedPreferencesController.instance.init();
  });

  tearDown(() async {
    // Clear the last call between tests to avoid leakage.
    await SharedPreferencesController.instance.remove(
      ConfigPropertyKey.lastApiCallNotification,
    );
  });

  group('NotificationThrottler with maxPerDay = 2 (slots ~12h)', () {
    test('No previous call today => not throttled', () {
      final DateTime now = DateTime(2025, 1, 1, 10);
      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        2,
        now: now,
      );
      expect(throttled, isFalse);
    });

    test('Previous call in same slot => throttled', () async {
      final DateTime now = DateTime(2025, 1, 1, 10); // slot 0 (00:00-11:59)
      final DateTime previous = DateTime(2025, 1, 1, 9); // same slot 0

      await SharedPreferencesController.instance.setString(
        ConfigPropertyKey.lastApiCallNotification,
        previous.toIso8601String(),
      );

      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        2,
        now: now,
      );
      expect(throttled, isTrue);
    });

    test('Previous call in different slot => not throttled', () async {
      final DateTime now = DateTime(2025, 1, 1, 20); // slot 1 (12:00-23:59)
      final DateTime previous = DateTime(2025, 1, 1, 10); // slot 0

      await SharedPreferencesController.instance.setString(
        ConfigPropertyKey.lastApiCallNotification,
        previous.toIso8601String(),
      );

      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        2,
        now: now,
      );
      expect(throttled, isFalse);
    });
  });

  group('NotificationThrottler with maxPerDay = 3 (slots ~8h)', () {
    test('No previous call today => not throttled', () {
      final DateTime now = DateTime(2025, 1, 1, 10); // slot 1
      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        3,
        now: now,
      );
      expect(throttled, isFalse);
    });

    test('Previous call in same slot => throttled', () async {
      final DateTime now = DateTime(2025, 1, 1, 10); // slot 1 (08:00-15:59)
      final DateTime previous = DateTime(2025, 1, 1, 12); // same slot 1

      await SharedPreferencesController.instance.setString(
        ConfigPropertyKey.lastApiCallNotification,
        previous.toIso8601String(),
      );

      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        3,
        now: now,
      );
      expect(throttled, isTrue);
    });

    test('Previous call in different slot => not throttled', () async {
      final DateTime now = DateTime(2025, 1, 1, 10); // slot 1
      final DateTime previous = DateTime(2025, 1, 1, 2); // slot 0

      await SharedPreferencesController.instance.setString(
        ConfigPropertyKey.lastApiCallNotification,
        previous.toIso8601String(),
      );

      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        3,
        now: now,
      );
      expect(throttled, isFalse);
    });

    test('Previous day => not throttled', () async {
      final DateTime now = DateTime(2025, 1, 1, 10); // any slot
      final DateTime previous = DateTime(2024, 12, 31, 22);

      await SharedPreferencesController.instance.setString(
        ConfigPropertyKey.lastApiCallNotification,
        previous.toIso8601String(),
      );

      final bool throttled = NotificationThrottler.isCallThrottledWithMax(
        3,
        now: now,
      );
      expect(throttled, isFalse);
    });
  });
}
