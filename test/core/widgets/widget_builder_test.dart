import 'package:application/core/widgets/widget_builder.dart' as wb;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('WidgetBuilder', () {
    test('buildRowWidgets returns empty list for empty input', () {
      // Given
      const widgets = <Widget>[];

      // When
      final result = wb.WidgetBuilder.buildRowWidgets(widgets);

      // Then
      expect(result, isEmpty);
    });

    test('buildRowWidgets returns single element for single input', () {
      // Given
      final widgets = [const Text('hello')];

      // When
      final result = wb.WidgetBuilder.buildRowWidgets(widgets);

      // Then
      expect(result.length, equals(1));
    });

    test('buildRowWidgets groups elements into rows', () {
      // Given
      final widgets = List.generate(4, (i) => Text('$i'));

      // When
      final result = wb.WidgetBuilder.buildRowWidgets(
        widgets,
        maxElementsPerRow: 2,
      );

      // Then
      expect(result.length, equals(2));
      expect(result[0], isA<Row>());
    });

    test('buildRowWidgets throws for invalid maxElementsPerRow', () {
      // Given
      final widgets = [const Text('test')];

      // When & Then
      expect(
        () => wb.WidgetBuilder.buildRowWidgets(widgets, maxElementsPerRow: 0),
        throwsException,
      );
    });
  });
}