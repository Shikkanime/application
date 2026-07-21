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
    final Iterable<Widget> toSeparateList, {
    final int maxElementsPerRow = 2,
  }) {
    if (maxElementsPerRow < 1) {
      throw Exception('maxElementsPerRow must be greater than 0');
    }

    if (maxElementsPerRow == 1) {
      return toSeparateList.toList();
    }

    return List<Widget>.generate(
      (toSeparateList.length / maxElementsPerRow).ceil(),
      (final int i) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(
          maxElementsPerRow,
          (final int j) => i * maxElementsPerRow + j < toSeparateList.length
              ? Expanded(
                  child: toSeparateList.elementAt(i * maxElementsPerRow + j),
                )
              : const Spacer(),
        ),
      ),
    );
  }
}
