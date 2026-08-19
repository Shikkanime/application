# Code Style Guide

## General style

- **Write all code, examples, and comments in English.**
- **Prefer short, readable, direct code** with explicit, descriptive names.
- **One responsibility per class and function.** Keep functions short and focused.
- **One statement per line.** Do not chain multiple statements on a single line.
- **No visual separators** in comments (no ASCII banner lines, no decorative `#`, `-`, `*` runs).
- **Reuse existing project patterns** instead of introducing new ones without need.
- **No premature abstraction and no duplication (DRY).** Do not copy-paste logic; extract it when reused.

## Classes, constructors and initializers

- **Use `const` constructors** (and `const` class instances) whenever possible. The `flutter_lints` analyzer enforces this.
- **Prefer `const` declarations** for local values and class members that never change.
- **Prefer constructors over static factory methods** unless the factory genuinely shines (this is enforced by the analyzer).
- **Prefer constructor injection** over positional parameter lists that are too long; use named optional parameters with defaults where needed.

```dart
class HttpClient {
  const HttpClient({this.timeout = const Duration(seconds: 10)});

  final Duration timeout;
}
```

For immutable data classes, use compact generative constructors:

```dart
class AnimeModel {
  final String uuid;
  final String shortName;
  final List<LangType> langTypes;
  final List<AnimePlatformModel> platformIds;

  AnimeModel(this.uuid, this.shortName, this.langTypes, this.platformIds);
}
```

## Imports

- **Import symbols directly** (`import 'package:application/models/lang_type.dart';`); never reference a type by its fully-qualified name inline.
- Imports are a single statement per line, following the existing ordering (project imports first, then third-party).

## Expression bodies

- Prefer **expression bodies** (`=>`) for simple getters and short functions, matching the existing code.

```dart
int get length => _animes.length + (_loading ? 8 : 0);

AnimeModel? getOrNull(int index) =>
    index >= 0 && index < _animes.length ? _animes[index] : null;
```

## No singletons

- **No global singletons or `Static` global state.** Dependencies are provided through the `provider` package (`MultiProvider`) in `main.dart` and injected via constructors.
- In widgets, read state with `context.watch<T>()` and send events with `context.read<T>()`.

## Naming

- Classes and interfaces: `PascalCase` (`AnimeViewModel`, `AppHorizontalListView`).
- Files and directories: `snake_case.dart` (`anime_view_model.dart`, `lang_type.dart`).
- Private instance fields: leading underscore (`_animes`, `_repository`).
- Local variables, parameters, methods, getters: `camelCase`.
- Constants: private-ish `camelCase` prefixed with `_` for instance values; `const` for true constants.
- Public domain interfaces (shared across layers) use `VerbNounViewModel` / `NounViewModel` naming (e.g. `LangTypeFilterViewModel`).

## Flutter / Dart conventions

- Widgets that hold state define a private `_State` companion class (`CatalogView` -> `_CatalogViewState`).
- Use `const` widget subtrees (`const Icon(...)`) whenever the subtree is static.
- Use `switch` expressions and modern Dart constructs (`is!`, `runtimeType`, spread) over legacy imperative equivalents where they read more cleanly.

## Lints (enforced)

The repository's `analysis_options.yaml` enables `flutter_lints` (`flutter_lints: ^6.0.0`) with these rules. Code MUST satisfy the analyzer at review time. The most relevant enforced rules:

- `prefer_const_constructors`
- `prefer_const_constructors_in_immutables`
- `prefer_const_declarations`
- `prefer_const_literals_to_create_immutables`
- `prefer_constructors_over_static_methods`

Always run `dart format lib` and `dart analyze lib` before submitting. `lib/models/*.g.dart` is excluded from analysis (generated code).