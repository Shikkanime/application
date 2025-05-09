import 'package:flutter/material.dart';

extension ExtensionsIterable<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(final R Function(int index, T e) f) {
    final List<R> result = <R>[];

    for (int i = 0; i < length; i++) {
      result.add(f(i, elementAt(i)));
    }

    return result;
  }
}

extension ExtensionsWidgetIterable<Widget> on Iterable<Widget> {
  List<Widget> joinTo(final Widget separator) {
    final List<Widget> result = <Widget>[];

    for (int i = 0; i < length; i++) {
      result.add(elementAt(i));

      if (i != length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}

extension ExtensionsThemeData on ThemeData {
  static final Map<Brightness, ButtonStyle> _map = <Brightness, ButtonStyle>{};
  static final Map<Brightness, AssetImage> _mapImage =
      <Brightness, AssetImage>{};
  static final Map<Brightness, Color> _mapOppositeTextColor =
      <Brightness, Color>{};

  void addInputDecorationTheme(final ButtonStyle buttonStyle) {
    _map[brightness] = buttonStyle;
  }

  void addImageDecorationTheme(final AssetImage image) {
    _mapImage[brightness] = image;
  }

  void addOppositeTextColor(final Color color) {
    _mapOppositeTextColor[brightness] = color;
  }

  ButtonStyle? get cardButtonStyle => _map[brightness];
  AssetImage? get iconImage => _mapImage[brightness];
  Color? get oppositeTextColor => _mapOppositeTextColor[brightness];
}

extension StringExtensions on String? {
  DateTime? toDateTime() {
    if (this == null) {
      return null;
    }

    return DateTime.tryParse(this!);
  }
}
