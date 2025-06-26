import 'dart:ui';

import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet }

class WidgetBuilder {
  static final WidgetBuilder instance = WidgetBuilder();

  DeviceType getDeviceType() {
    final Display display = PlatformDispatcher.instance.views.first.display;

    return display.size.shortestSide / display.devicePixelRatio < 600
        ? DeviceType.mobile
        : DeviceType.tablet;
  }

  List<Widget> buildRowWidgets(
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
