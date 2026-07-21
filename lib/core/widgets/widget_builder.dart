import 'dart:ui';

import 'package:flutter/material.dart';

/// Device type enum for responsive layout decisions.
enum DeviceType { mobile, tablet }

/// Utility class for responsive widget building.
///
/// Provides methods to detect device type and build responsive row layouts.
/// All methods are static — no instance needed.
class WidgetBuilder {
  WidgetBuilder._();

  /// Detects the current device type based on screen width.
  ///
  /// Returns [DeviceType.tablet] if the shortest side is >= 600dp,
  /// [DeviceType.mobile] otherwise.
  static DeviceType getDeviceType() {
    final Display display = PlatformDispatcher.instance.views.first.display;

    return display.size.shortestSide / display.devicePixelRatio < 600
        ? DeviceType.mobile
        : DeviceType.tablet;
  }

  /// Splits [toSeparateList] into rows with at most [maxElementsPerRow] per row.
  ///
  /// Throws if [maxElementsPerRow] is less than 1.
  static List<Widget> buildRowWidgets(
    final Iterable<Widget> items, {
    final int maxElementsPerRow = 2,
  }) {
    if (maxElementsPerRow < 1) {
      throw Exception('maxElementsPerRow must be greater than 0');
    }

    if (maxElementsPerRow == 1 || items.length <= 1) {
      return items.toList();
    }

    final itemsList = items.toList(growable: false);
    final rowCount = (itemsList.length / maxElementsPerRow).ceil();

    return List<Widget>.generate(rowCount, (final i) {
      final start = i * maxElementsPerRow;
      final end = (start + maxElementsPerRow).clamp(0, itemsList.length);
      final rowItems = itemsList.sublist(start, end);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _fillRow(rowItems, maxElementsPerRow),
      );
    });
  }

  /// Fills [rowItems] with [Spacer]s to reach [maxElementsPerRow] width.
  static List<Widget> _fillRow(
    final List<Widget> rowItems,
    final int maxElementsPerRow,
  ) {
    return List<Widget>.generate(maxElementsPerRow, (final j) {
      if (j < rowItems.length) {
        return Expanded(child: rowItems[j]);
      }
      return const Spacer();
    });
  }
}
