import 'dart:ui';

import 'package:flutter/material.dart';

enum DeviceType {
  mobile,
  tablet,
}

class WidgetBuilder {
  static final instance = WidgetBuilder();

  DeviceType getDeviceType() {
    final display = PlatformDispatcher.instance.views.first.display;

    return display.size.shortestSide / display.devicePixelRatio < 600
        ? DeviceType.mobile
        : DeviceType.tablet;
  }

  List<Widget> buildRowWidgets(
    Iterable<Widget> toSeparateList, {
    int maxElementsPerRow = 2,
  }) {
    final widgets = <Widget>[];

    if (maxElementsPerRow < 1) {
      throw Exception('maxElementsPerRow must be greater than 0');
    }

    if (maxElementsPerRow == 1) {
      widgets.addAll(toSeparateList);
      return widgets;
    }

    for (int i = 0; i < toSeparateList.length; i += maxElementsPerRow) {
      widgets.add(
        Row(
          children: List.generate(maxElementsPerRow, (j) {
            return i + j < toSeparateList.length
                ? Expanded(child: toSeparateList.elementAt(i + j))
                : const Spacer();
          }),
        ),
      );
    }

    return widgets;
  }
}
