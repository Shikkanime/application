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

/// Custom immutable theme properties for the application.
///
/// Registered via `ThemeData(extensions: [CustomTheme(...)])`.
@immutable
class CustomTheme extends ThemeExtension<CustomTheme> {
  const CustomTheme({
    this.cardButtonStyle,
    this.iconImage,
    this.oppositeTextColor,
  });

  /// Custom button style for cards.
  final ButtonStyle? cardButtonStyle;

  /// Custom icon asset image for the active theme brightness.
  final AssetImage? iconImage;

  /// Custom text color contrasting with the theme background.
  final Color? oppositeTextColor;

  @override
  CustomTheme copyWith({
    final ButtonStyle? cardButtonStyle,
    final AssetImage? iconImage,
    final Color? oppositeTextColor,
  }) {
    return CustomTheme(
      cardButtonStyle: cardButtonStyle ?? this.cardButtonStyle,
      iconImage: iconImage ?? this.iconImage,
      oppositeTextColor: oppositeTextColor ?? this.oppositeTextColor,
    );
  }

  @override
  CustomTheme lerp(final ThemeExtension<CustomTheme>? other, final double t) {
    if (other is! CustomTheme) {
      return this;
    }

    return CustomTheme(
      cardButtonStyle: ButtonStyle.lerp(
        cardButtonStyle,
        other.cardButtonStyle,
        t,
      ),
      iconImage: t < 0.5 ? iconImage : other.iconImage,
      oppositeTextColor: Color.lerp(
        oppositeTextColor,
        other.oppositeTextColor,
        t,
      ),
    );
  }
}

/// Extension methods on [ThemeData] to access custom theme properties.
extension ThemeDataExtensions on ThemeData {
  /// Returns the registered [CustomTheme] extension attached to this [ThemeData], if any.
  CustomTheme? get customTheme => extension<CustomTheme>();

  /// Returns the registered card [ButtonStyle] for the current theme, or `null` if none was set.
  ButtonStyle? get cardButtonStyle => customTheme?.cardButtonStyle;

  /// Returns the registered icon [AssetImage] for the current theme, or `null` if none was set.
  AssetImage? get iconImage => customTheme?.iconImage;

  /// Returns the registered opposite text [Color] for the current theme, or `null` if none was set.
  Color? get oppositeTextColor => customTheme?.oppositeTextColor;
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
