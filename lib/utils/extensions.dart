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

extension ExtensionsThemeData on ThemeData {
  static final Map<Brightness, ButtonStyle> _map = <Brightness, ButtonStyle>{};
  static final Map<Brightness, AssetImage> _mapImage =
      <Brightness, AssetImage>{};

  void addInputDecorationTheme(final ButtonStyle buttonStyle) {
    _map[brightness] = buttonStyle;
  }

  void addImageDecorationTheme(final AssetImage image) {
    _mapImage[brightness] = image;
  }

  ButtonStyle? getCardButtonStyle() => _map[brightness];
  AssetImage? getIconImage() => _mapImage[brightness];
}

extension StringExtensions on String? {
  DateTime? toDateTime() {
    if (this == null) {
      return null;
    }

    return DateTime.tryParse(this!);
  }
}
