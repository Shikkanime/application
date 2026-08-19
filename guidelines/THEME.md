# Theme Guide

Theming is centralized in `lib/core/theme/` and driven by Material 3 (`ThemeData`). The app supports **light** and **dark** modes.

## Structure

- `app_theme.dart` — `AppTheme` (a `sealed` class) exposing `light` and `dark` `ThemeData` getters, built by a private `_build(...)` helper.
- `app_theme_colors.dart` — `AppThemeExtension`, a `ThemeExtension` carrying custom color/image tokens not covered by `ThemeData`.
- Both are consumed through `Theme.of(context)`.

## AppTheme

`AppTheme.light` and `AppTheme.dark` each return a fully-built `ThemeData` (brightness, seed `colorScheme`, text theme, app bar / navigation bar / FAB / button / snack bar / icon / dialog / bottom sheet / divider themes, and the `AppThemeExtension`).

```dart
sealed class AppTheme {
  static ThemeData get light => _build(
    brightness: Brightness.light,
    iconImage: const AssetImage('assets/dark_icon.png'),
    /* ... */
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    /* ... */
  );

  static ThemeData _build({...}) { /* assemble ThemeData */ }
}
```

- Register both themes in `MaterialApp` via `theme:` and `darkTheme:`, and enable mode switching in `main.dart`:

```dart
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  /* ... */
)
```

## AppThemeExtension

- Custom tokens that are not standard `ThemeData` go in a `ThemeExtension<AppThemeExtension>`.
- It MUST implement `copyWith` and `lerp` (required by `ThemeExtension`).
- Register it inside each theme's `extensions` list.

```dart
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.inverseTextColor,
    required this.iconImage,
  });

  final Color inverseTextColor;
  final ImageProvider iconImage;

  @override
  AppThemeExtension copyWith({Color? inverseTextColor, ImageProvider? iconImage}) { ... }

  @override
  AppThemeExtension lerp(covariant AppThemeExtension? other, double t) { ... }
}
```

## Reading custom theme values in widgets

- Access `ThemeData` values with `Theme.of(context)`.
- Access `AppThemeExtension` values via:

```dart
final inverseTextColor = Theme.of(context)
    .extension<AppThemeExtension>()
    ?.inverseTextColor;
```

- To fall back on the system brightness when extension values are absent, use the null-safe accessor shown above.

## Rules

- **Do not hardcode colors or fonts in widgets.** Always read them from `Theme.of(context)` or `AppThemeExtension`.
- Keep all theme material (colors, images, fonts) inside `lib/core/theme/`; widgets consume it.
- The app font is **Satoshi** (declared in `pubspec.yaml` and set via `fontFamily` in `AppTheme._build`). Keep single source of truth for font constants in `_build`.