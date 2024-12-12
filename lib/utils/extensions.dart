import 'package:flutter/material.dart';

extension ExtensionsList<T> on List<T> {
  List<R> mapIndexed<R>(final R Function(int index, T e) f) {
    final List<R> result = <R>[];

    for (int i = 0; i < length; i++) {
      result.add(f(i, this[i]));
    }

    return result;
  }
}

extension ExtensionsThemeData on ThemeData {
  static final Map<Brightness, ButtonStyle> _map = <Brightness, ButtonStyle>{};

  void addInputDecorationTheme(final ButtonStyle buttonStyle) {
    _map[brightness] = buttonStyle;
  }

  ButtonStyle? getCardButtonStyle() => _map[brightness];
}
