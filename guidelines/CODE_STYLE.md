# Code Style Guide

Based on **Effective Dart** (https://dart.dev/effective-dart/style).

## General Style

- Write all code, examples, and comments in **English**.
- Format code using `dart format` (the official formatter).
- Prefer lines **80 characters or fewer**.
- Keep one clear responsibility per class or function.
- Reuse existing project patterns over introducing new ones.
- Keep comments rare, useful, and focused on non-obvious behavior.

## Naming Conventions

| What | Convention | Example |
|------|-----------|---------|
| Types (classes, enums, typedefs) | `UpperCamelCase` | `HomeViewModel`, `AnimeDto` |
| Extensions | `UpperCamelCase` | `StringExtensions` |
| Packages, directories, files | `lowercase_with_underscores` | `anime_repository.dart` |
| Variables, parameters, methods | `lowerCamelCase` | `httpRequest`, `fetchItems()` |
| Constants | `lowerCamelCase` | `const defaultTimeout = 1000;` |
| Unused callback parameters | `_` (wildcard) | `then((_) => ...)` |

## Ordering

1. `dart:` imports
2. `package:` imports (blank line before)
3. Relative imports (blank line before)
4. `export` directives (blank line after all imports)
5. Each section sorted alphabetically

## Comments

- **Document the "why", not the "what"** — good code is self-documenting.
- Use `///` doc comments for public APIs.
- Use `//` for internal explanatory comments.
- Add a comment explaining the **business reason** when calling a Repository or Service.

```dart
// Good: explain intent
final episodes = await episodeRepository.fetchAll(); // Refresh to show latest episodes

// Bad: explain the obvious
final episodes = await episodeRepository.fetchAll(); // call fetchAll on episodeRepository
```

## Lint Rules

Only the following lint rules are applied. Do not add new ones without team discussion.

```yaml
rules:
  - prefer_const_constructors
  - prefer_const_constructors_in_immutables
  - prefer_const_declarations
  - prefer_const_literals_to_create_immutables
  - prefer_constructors_over_static_methods
```

## Immutability

- All data models must be **immutable** (use `freezed` + `copyWith`).
- Prefer `final` fields over mutable ones.
- Prefer `const` constructors where possible.

## Dart-specific Conventions

- Use **expression bodies** (`=>`) for simple functions.
- Use **curly braces** for all flow control statements (except single-line `if` without `else`).
- Use `super` parameters for constructors.
- Use `wildcard` variables for unused parameters (`_`).