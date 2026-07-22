import 'package:application/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IterableExtensions', () {
    group('mapIndexed', () {
      test('returns empty iterable when original iterable is empty', () {
        // Given
        final items = <int>[];

        // When
        final result = items.mapIndexed((index, element) => '$index: $element');

        // Then
        expect(result, isEmpty);
      });

      test('maps elements with 0-based indices correctly', () {
        // Given
        final items = ['apple', 'banana', 'cherry'];

        // When
        final result = items
            .mapIndexed((index, element) => '$index-$element')
            .toList();

        // Then
        expect(result, equals(['0-apple', '1-banana', '2-cherry']));
      });

      test('works with non-List iterables lazily', () {
        // Given
        final items = {'a', 'b', 'c'};

        // When
        final result = items.mapIndexed((index, element) => index * 2).toList();

        // Then
        expect(result, equals([0, 2, 4]));
      });
    });
  });

  group('CustomTheme', () {
    test('copyWith returns a new instance with updated properties', () {
      // Given
      const original = CustomTheme(
        oppositeTextColor: Colors.white,
        iconImage: AssetImage('assets/dark_icon.png'),
      );

      // When
      final updated = original.copyWith(oppositeTextColor: Colors.black);

      // Then
      expect(updated.oppositeTextColor, equals(Colors.black));
      expect(
        updated.iconImage,
        equals(const AssetImage('assets/dark_icon.png')),
      );
    });

    test('lerp interpolates values between themes', () {
      // Given
      const themeA = CustomTheme(oppositeTextColor: Colors.black);
      const themeB = CustomTheme(oppositeTextColor: Colors.white);

      // When
      final lerped = themeA.lerp(themeB, 0.5);

      // Then
      expect(
        lerped.oppositeTextColor,
        equals(Color.lerp(Colors.black, Colors.white, 0.5)),
      );
    });

    test('lerp returns self if other is not CustomTheme', () {
      // Given
      const theme = CustomTheme(oppositeTextColor: Colors.black);

      // When
      final lerped = theme.lerp(null, 0.5);

      // Then
      expect(lerped, equals(theme));
    });
  });

  group('ThemeDataExtensions', () {
    test('retrieves customTheme properties when extension is present', () {
      // Given
      final style = ElevatedButton.styleFrom(backgroundColor: Colors.black);
      const icon = AssetImage('assets/dark_icon.png');

      final theme = ThemeData(
        brightness: Brightness.dark,
        extensions: <ThemeExtension<dynamic>>[
          CustomTheme(
            cardButtonStyle: style,
            iconImage: icon,
            oppositeTextColor: Colors.white,
          ),
        ],
      );

      // When & Then
      expect(theme.customTheme, isNotNull);
      expect(theme.cardButtonStyle, equals(style));
      expect(theme.iconImage, equals(icon));
      expect(theme.oppositeTextColor, equals(Colors.white));
    });

    test('returns null for getters when CustomTheme extension is absent', () {
      // Given
      final theme = ThemeData(brightness: Brightness.light);

      // When & Then
      expect(theme.customTheme, isNull);
      expect(theme.cardButtonStyle, isNull);
      expect(theme.iconImage, isNull);
      expect(theme.oppositeTextColor, isNull);
    });
  });

  group('StringExtensions', () {
    group('toDateTime', () {
      test('returns null when string is null', () {
        // Given
        const String? nullString = null;

        // When & Then
        expect(nullString.toDateTime(), isNull);
      });

      test('returns null when string is empty', () {
        // Given
        const emptyString = '';

        // When & Then
        expect(emptyString.toDateTime(), isNull);
      });

      test('returns null when string is invalid date format', () {
        // Given
        const invalidDate = 'not-a-date';

        // When & Then
        expect(invalidDate.toDateTime(), isNull);
      });

      test('parses valid ISO-8601 string to DateTime', () {
        // Given
        const validDateStr = '2026-07-22T11:48:38.000Z';

        // When
        final parsed = validDateStr.toDateTime();

        // Then
        expect(parsed, isNotNull);
        expect(parsed!.year, equals(2026));
        expect(parsed.month, equals(7));
        expect(parsed.day, equals(22));
      });
    });
  });
}
