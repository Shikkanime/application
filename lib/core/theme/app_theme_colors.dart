import 'package:material_ui/material_ui.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.inverseTextColor,
    required this.warningTextColor,
    required this.iconImage,
  });

  final Color inverseTextColor;
  final Color warningTextColor;
  final ImageProvider iconImage;

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? inverseTextColor,
    Color? warningTextColor,
    ImageProvider? iconImage,
  }) {
    return AppThemeExtension(
      inverseTextColor: inverseTextColor ?? this.inverseTextColor,
      warningTextColor: warningTextColor ?? this.warningTextColor,
      iconImage: iconImage ?? this.iconImage,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant AppThemeExtension? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return AppThemeExtension(
      inverseTextColor: Color.lerp(
        inverseTextColor,
        other.inverseTextColor,
        t,
      )!,
      warningTextColor: Color.lerp(
        warningTextColor,
        other.warningTextColor,
        t,
      )!,
      iconImage: iconImage,
    );
  }
}
