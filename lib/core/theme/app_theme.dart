import 'package:application/core/theme/app_theme_colors.dart';
import 'package:material_ui/material_ui.dart';

sealed class AppTheme {
  static ThemeData get light => _build(
    brightness: Brightness.light,
    iconImage: const AssetImage('assets/dark_icon.png'),
    scaffoldBackgroundColor: const Color(0xfff0f0f0),
    primaryColor: Colors.black,
    canvasColor: Colors.white,
    textColor: Colors.black,
    inverseTextColor: Colors.white,
    greyColor: Colors.grey[800]!,
    snackBarBackgroundColor: Colors.white,
    elevatedButtonBackgroundColor: Colors.white,
    elevatedButtonShadowColor: Colors.grey[300]!,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    iconImage: const AssetImage('assets/light_icon.png'),
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    canvasColor: const Color(0xff161616),
    textColor: Colors.white,
    inverseTextColor: Colors.black,
    greyColor: Colors.grey[400]!,
    snackBarBackgroundColor: Colors.grey[900]!,
    elevatedButtonBackgroundColor: const Color(0xff282828),
    elevatedButtonShadowColor: Colors.grey[900]!,
  );

  static ThemeData _build({
    required Brightness brightness,
    required ImageProvider iconImage,
    required Color scaffoldBackgroundColor,
    required Color primaryColor,
    required Color canvasColor,
    required Color textColor,
    required Color inverseTextColor,
    required Color greyColor,
    required Color snackBarBackgroundColor,
    required Color elevatedButtonBackgroundColor,
    required Color elevatedButtonShadowColor,
  }) {
    const fontFamily = 'Satoshi';
    const appBarBackgroundOpacity = 0.6;
    const bodyLargeFontSize = 16.0;
    const bodySmallFontSize = 11.0;
    const searchBarFontSize = 16.0;
    const popupMenuBorderRadius = 16.0;

    return ThemeData(
      brightness: brightness,
      fontFamily: fontFamily,
      colorScheme: .fromSeed(
        brightness: brightness,
        seedColor: primaryColor,
        primary: primaryColor,
      ),
      extensions: [
        AppThemeExtension(
          inverseTextColor: inverseTextColor,
          iconImage: iconImage,
        ),
      ],
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor.withValues(
          alpha: appBarBackgroundOpacity,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: canvasColor,
      ),
      canvasColor: canvasColor,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: bodyLargeFontSize,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: greyColor),
        bodySmall: TextStyle(color: greyColor, fontSize: bodySmallFontSize),
      ),
      iconTheme: IconThemeData(color: greyColor),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: snackBarBackgroundColor,
        contentTextStyle: TextStyle(color: textColor),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: scaffoldBackgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: elevatedButtonBackgroundColor,
          shadowColor: elevatedButtonShadowColor,
        ),
      ),
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll(elevatedButtonBackgroundColor),
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: textColor, fontSize: searchBarFontSize),
        ),
        constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
        elevation: const WidgetStatePropertyAll(1),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: canvasColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(popupMenuBorderRadius),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: elevatedButtonBackgroundColor,
          shadowColor: elevatedButtonShadowColor,
          foregroundColor: primaryColor,
        ),
      ),
      dialogTheme: DialogThemeData(backgroundColor: canvasColor),
      bottomSheetTheme: BottomSheetThemeData(
        surfaceTintColor: canvasColor,
        backgroundColor: canvasColor,
      ),
      dividerTheme: DividerThemeData(color: primaryColor),
    );
  }
}
