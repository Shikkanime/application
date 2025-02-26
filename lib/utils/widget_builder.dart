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
    final List<Widget> widgets = <Widget>[];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
            maxElementsPerRow,
            (final int j) =>
                i + j < toSeparateList.length
                    ? Expanded(child: toSeparateList.elementAt(i + j))
                    : const Spacer(),
          ),
        ),
      );
    }

    return widgets;
  }
}
