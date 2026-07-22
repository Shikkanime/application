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

  group('ThemeDataExtensions', () {
    test('stores and retrieves cardButtonStyle based on brightness', () {
      // Given
      final darkTheme = ThemeData(brightness: Brightness.dark);
      final lightTheme = ThemeData(brightness: Brightness.light);
      final darkStyle = ElevatedButton.styleFrom(backgroundColor: Colors.black);
      final lightStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      );

      // When
      darkTheme.addCardButtonStyle(darkStyle);
      lightTheme.addCardButtonStyle(lightStyle);

      // Then
      expect(darkTheme.cardButtonStyle, equals(darkStyle));
      expect(lightTheme.cardButtonStyle, equals(lightStyle));
    });

    test('stores and retrieves iconImage based on brightness', () {
      // Given
      final darkTheme = ThemeData(brightness: Brightness.dark);
      final lightTheme = ThemeData(brightness: Brightness.light);
      const darkIcon = AssetImage('assets/dark_icon.png');
      const lightIcon = AssetImage('assets/light_icon.png');

      // When
      darkTheme.addImageDecorationTheme(darkIcon);
      lightTheme.addImageDecorationTheme(lightIcon);

      // Then
      expect(darkTheme.iconImage, equals(darkIcon));
      expect(lightTheme.iconImage, equals(lightIcon));
    });

    test('stores and retrieves oppositeTextColor based on brightness', () {
      // Given
      final darkTheme = ThemeData(brightness: Brightness.dark);
      final lightTheme = ThemeData(brightness: Brightness.light);

      // When
      darkTheme.addOppositeTextColor(Colors.white);
      lightTheme.addOppositeTextColor(Colors.black);

      // Then
      expect(darkTheme.oppositeTextColor, equals(Colors.white));
      expect(lightTheme.oppositeTextColor, equals(Colors.black));
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
