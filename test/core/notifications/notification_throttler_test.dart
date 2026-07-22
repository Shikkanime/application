import 'package:application/core/notifications/notification_throttler.dart';
import 'package:application/data/models/enums/config_property_key.dart';
import 'package:application/ui/viewmodels/shared_preferences_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await SharedPreferencesController.instance.init();
  });

  tearDown(() async {
    await SharedPreferencesController.instance.remove(
      ConfigPropertyKey.lastApiCallNotification,
    );
  });

  group('NotificationThrottler with maxPerDay = 2 (slots ~12h)', () {
    test(
      'Given no previous call today when checking throttle then returns false',
      () {
        final DateTime now = DateTime(2025, 1, 1, 10);
        final bool throttled = NotificationThrottler.isCallThrottledWithMax(
          2,
          now: now,
        );
        expect(throttled, isFalse);
      },
    );

    test(
      'Given previous call in same slot when checking throttle then returns true',
      () async {
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
      },
    );

    test(
      'Given previous call in different slot when checking throttle then returns false',
      () async {
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
      },
    );
  });

  group('NotificationThrottler with maxPerDay = 3 (slots ~8h)', () {
    test(
      'Given no previous call today when checking throttle then returns false',
      () {
        final DateTime now = DateTime(2025, 1, 1, 10); // slot 1
        final bool throttled = NotificationThrottler.isCallThrottledWithMax(
          3,
          now: now,
        );
        expect(throttled, isFalse);
      },
    );

    test(
      'Given previous call in same slot when checking throttle then returns true',
      () async {
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
      },
    );

    test(
      'Given previous call in different slot when checking throttle then returns false',
      () async {
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
      },
    );

    test(
      'Given previous call on previous day when checking throttle then returns false',
      () async {
        final DateTime now = DateTime(2025, 1, 1, 10);
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
      },
    );
  });

  group('NotificationThrottler edge cases and recordCall', () {
    test('Given maxPerDay <= 0 when checking throttle then returns true', () {
      final bool throttled = NotificationThrottler.isCallThrottledWithMax(0);
      expect(throttled, isTrue);
    });

    test(
      'Given invalid date string in preferences when checking throttle then returns false',
      () async {
        await SharedPreferencesController.instance.setString(
          ConfigPropertyKey.lastApiCallNotification,
          'invalid-date-string',
        );

        final bool throttled = NotificationThrottler.isCallThrottledWithMax(2);
        expect(throttled, isFalse);
      },
    );

    test(
      'Given recordCall called when executing then saves current timestamp',
      () async {
        final DateTime now = DateTime(2025, 1, 15, 14, 30);
        await NotificationThrottler.recordCall(now: now);

        final String? saved = SharedPreferencesController.instance.getString(
          ConfigPropertyKey.lastApiCallNotification,
        );
        expect(saved, equals(now.toIso8601String()));
      },
    );
  });
}
