# Code Style Guide

Based on **Effective Dart** (https://dart.dev/effective-dart/style).

## General Style

- Write all code, examples, and comments in **English**.
- Format code using `dart format` (the official formatter).
- Prefer lines **80 characters or fewer**.
- Keep one clear responsibility per class or function.
- **Maximum Method Length**: Every function or method must be **50 lines of code or fewer**. Excessively long methods must be decomposed into smaller, single-responsibility helper methods.
- **No Unnecessary Abstractions**: Do not use `abstract` on utility classes when a simple class with a private constructor (`Class._();`) is sufficient.
- Reuse existing project patterns over introducing new ones.
- Keep comments rare, useful, and focused on non-obvious behavior. Add internal `//` comments to explain complex mathematical, algorithmic, or non-obvious logic.

## Naming Conventions

| What | Convention | Example |
|------|-----------|---------|
| Types (classes, enums, typedefs) | `UpperCamelCase` | `HomeViewModel`, `AnimeDto` |
| Extensions | `UpperCamelCase` | `StringExtensions` |
| Packages, directories, files | `lowercase_with_underscores` | `anime_repository.dart` |
| **File name matches class name** | `api_client.dart` ↔ `ApiClient` | `ApiClient` → `api_client.dart` |
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
- **Prohibition of Visual Separation Blocks**: Comments that serve as visual separators or section titles are strictly forbidden (`// ----`, `// Private helpers`, `// === UI METHODS ===`, `// MARK: - Properties`). Encapsulation, class ordering, and method composition must render code self-explanatory.

```dart
// Good: explain intent
final episodes = await episodeRepository.fetchAll(); // Refresh to show latest episodes

// Bad: explain the obvious
final episodes = await episodeRepository.fetchAll(); // call fetchAll on episodeRepository

// Bad: visual separators (STRICTLY FORBIDDEN)
// ---------------------------------------------------------------------------
// Private helpers
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

- **Never put multiple statements on a single line** — each statement must be on its own line.
- Use **expression bodies** (`=>`) for simple functions.
- Use **curly braces** for all flow control statements (except single-line `if` without `else`).
- Use `super` parameters for constructors.
- Use `wildcard` variables for unused parameters (`_`).

## Type Annotations (Effective Dart guidelines)

Follow Google's Effective Dart recommendations for type annotations:

### Local variables
- **Use `var`** when the type is obvious from the right-hand side:
  ```dart
  var count = 3; // int is obvious
  var items = <String>[]; // type is explicit in literal
  ```
- **Use `final`** when the variable is never reassigned (prefer over `var`):
  ```dart
  final name = 'Dart'; // never reassigned
  final response = await client.get(...); // single assignment
  ```
- **Use explicit type annotations** when the type is not obvious or when it's part of a public API:
  ```dart
  // Good: type is not obvious from the RHS
  final Map<String, dynamic> json = jsonDecode(body);
  
  // Bad: unnecessary type annotation
  final String name = 'Dart';
  ```

### Parameters and return types
- **Always annotate** public API parameters and return types.
- **Use `Object?`** instead of `dynamic` when you need to accept any value.
- **Prefer `Future<void>`** over `Future` for async methods that don't return a value.

### Constants
- Use `const` for compile-time constants.
- Name constants using `lowerCamelCase` (not `SCREAMING_CAPS`):
  ```dart
  const defaultTimeout = 1000; // Good
  const DEFAULT_TIMEOUT = 1000; // Bad
  ```

### Best practices
- **DO** follow a consistent rule for `var` and `final` on local variables.
- **AVOID** storing what you can calculate.
- **DO** use collection literals (`[]`, `{}`) over `List()` / `Map()`.
- **DON'T** use `.length` to check if a collection is empty — use `.isEmpty`.
- **PREFER** `async`/`await` over raw futures.
- **DON'T** create a lambda when a tear-off will do.