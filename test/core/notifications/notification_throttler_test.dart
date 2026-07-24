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

  group('NotificationThrottler', () {
    group('isCallThrottledWithMax', () {
      test('should return false when no previous call today', () {
        // Given
        final now = DateTime(2025, 1, 1, 10);

        // When & Then
        expect(
          NotificationThrottler.isCallThrottledWithMax(2, now: now),
          isFalse,
        );
      });

      test('should return true when previous call is in same slot', () async {
        // Given
        final now = DateTime(2025, 1, 1, 10); // slot 0 (00:00-11:59)
        final previous = DateTime(2025, 1, 1, 9); // same slot 0

        await SharedPreferencesController.instance.setString(
          ConfigPropertyKey.lastApiCallNotification,
          previous.toIso8601String(),
        );

        // When & Then
        expect(
          NotificationThrottler.isCallThrottledWithMax(2, now: now),
          isTrue,
        );
      });

      test(
        'should return false when previous call is in different slot',
        () async {
          // Given
          final now = DateTime(2025, 1, 1, 20); // slot 1 (12:00-23:59)
          final previous = DateTime(2025, 1, 1, 10); // slot 0

          await SharedPreferencesController.instance.setString(
            ConfigPropertyKey.lastApiCallNotification,
            previous.toIso8601String(),
          );

          // When & Then
          expect(
            NotificationThrottler.isCallThrottledWithMax(2, now: now),
            isFalse,
          );
        },
      );

      test(
        'should return false when previous call was on previous day',
        () async {
          // Given
          final now = DateTime(2025, 1, 1, 10);
          final previous = DateTime(2024, 12, 31, 22);

          await SharedPreferencesController.instance.setString(
            ConfigPropertyKey.lastApiCallNotification,
            previous.toIso8601String(),
          );

          // When & Then
          expect(
            NotificationThrottler.isCallThrottledWithMax(3, now: now),
            isFalse,
          );
        },
      );

      test('should return true when maxPerDay is non-positive', () {
        // Given & When & Then
        expect(NotificationThrottler.isCallThrottledWithMax(0), isTrue);
      });

      test(
        'should return false when timestamp format in preferences is invalid',
        () async {
          // Given
          await SharedPreferencesController.instance.setString(
            ConfigPropertyKey.lastApiCallNotification,
            'invalid-date-string',
          );

          // When & Then
          expect(NotificationThrottler.isCallThrottledWithMax(2), isFalse);
        },
      );
    });

    group('recordCall', () {
      test('should save current timestamp in preferences', () async {
        // Given
        final now = DateTime(2025, 1, 15, 14, 30);

        // When
        await NotificationThrottler.recordCall(now: now);

        // Then
        expect(
          SharedPreferencesController.instance.getString(
            ConfigPropertyKey.lastApiCallNotification,
          ),
          equals(now.toIso8601String()),
        );
      });
    });
  });
}
