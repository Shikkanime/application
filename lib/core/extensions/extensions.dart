import 'package:flutter/material.dart';

/// Extension methods on [Iterable].
extension IterableExtensions<T> on Iterable<T> {
  /// Maps each element of this iterable along with its 0-based index
  /// to a new value using the provided function [f].
  ///
  /// Evaluates lazily using a `sync*` generator, providing $O(N)$ execution time
  /// across any collection type.
  Iterable<R> mapIndexed<R>(final R Function(int index, T element) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(index++, element);
    }
  }
}

/// Extension methods on [ThemeData] to store and retrieve custom theme properties
/// based on brightness (light/dark mode).
extension ThemeDataExtensions on ThemeData {
  static final Map<Brightness, ButtonStyle> _cardButtonStyleMap =
      <Brightness, ButtonStyle>{};
  static final Map<Brightness, AssetImage> _iconImageMap =
      <Brightness, AssetImage>{};
  static final Map<Brightness, Color> _oppositeTextColorMap =
      <Brightness, Color>{};

  /// Registers a custom [ButtonStyle] for cards associated with the current [brightness].
  void addCardButtonStyle(final ButtonStyle buttonStyle) {
    _cardButtonStyleMap[brightness] = buttonStyle;
  }

  /// Registers a custom [AssetImage] icon associated with the current [brightness].
  void addImageDecorationTheme(final AssetImage image) {
    _iconImageMap[brightness] = image;
  }

  /// Registers an opposite text [Color] associated with the current [brightness].
  void addOppositeTextColor(final Color color) {
    _oppositeTextColorMap[brightness] = color;
  }

  /// Returns the registered card [ButtonStyle] for the current theme [brightness],
  /// or `null` if none was set.
  ButtonStyle? get cardButtonStyle => _cardButtonStyleMap[brightness];

  /// Returns the registered icon [AssetImage] for the current theme [brightness],
  /// or `null` if none was set.
  AssetImage? get iconImage => _iconImageMap[brightness];

  /// Returns the registered opposite text [Color] for the current theme [brightness],
  /// or `null` if none was set.
  Color? get oppositeTextColor => _oppositeTextColorMap[brightness];
}

/// Extension methods on nullable [String].
extension StringExtensions on String? {
  /// Parses the string as an ISO-8601 date, or returns `null` if the string is
  /// null, empty, or not a valid date format.
  DateTime? toDateTime() {
    final value = this;
    if (value == null || value.isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }
}
