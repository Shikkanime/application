import 'package:material_ui/material_ui.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.inverseTextColor,
    required this.iconImage,
  });

  final Color inverseTextColor;
  final ImageProvider iconImage;

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? inverseTextColor,
    ImageProvider? iconImage,
  }) {
    return AppThemeExtension(
      inverseTextColor: inverseTextColor ?? this.inverseTextColor,
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
      iconImage: iconImage,
    );
  }
}
