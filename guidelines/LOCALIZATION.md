# Localization Guide

Localization uses Flutter's built-in **gen-l10n** (`flutter gen-l10n`). UI strings are resolved through `AppLocalizations`.

> **Source language note:** the source/template localization is **French** (`app_fr.arb`). This is intentional even though all code is otherwise in English. Add/change UI strings in French; only add other `.arb` locale files when a translation is actually needed.

## Configuration

`l10n.yaml` at the repository root drives code generation:

```yaml
arb-dir: lib/l10n
template-arb-file: app_fr.arb
output-localization-file: app_localizations.dart
format: true
```

- `arb-dir: lib/l10n` — where `.arb` files live.
- `template-arb-file: app_fr.arb` — the source French template.
- `output-localization-file: app_localizations.dart` — generated entry point in `lib/l10n/`.
- `format: true` — generated files are formatted.

## Adding / changing a string

1. Add or update the key in `lib/l10n/app_fr.arb`:

```json
{
  "catalog": "Catalogue",
  "search": "Rechercher..."
}
```

2. Regenerate the localizations with:

```bash
flutter gen-l10n
```

3. Use the generated getter in widgets via `AppLocalizations.of(context)!`:

```dart
SearchBar(
  hintText: AppLocalizations.of(context)!.search,
)
```

## Wiring

- `AppLocalizations` is wired once in `main.dart` (`MaterialApp.localizationsDelegates` + `supportedLocales`) and in `pubspec.yaml` (`flutter: generate: true`). Do not re-add delegates per widget.

```dart
MaterialApp(
  localizationsDelegates: const [
    ...GlobalMaterialLocalizations.delegates,
    ...AppLocalizations.localizationsDelegates,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
  /* ... */
)
```

## Rules

- **Never hardcode user-facing strings** in widgets; always use `AppLocalizations.of(context)!`.
- Keep strings in `.arb`, not inline.
- Source-language strings are French; do not translate existing strings unless the feature changes.
- Do not hand-edit generated `app_localizations*.dart` files.