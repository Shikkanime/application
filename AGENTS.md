# LLM Agent Instructions - Shikkanime Application (Flutter)

As an AI agent, your primary directive is to adhere to the established patterns and architectural principles of this project. Your goal is to write clean, maintainable Flutter code that aligns with the existing codebase. This application is built on a **Model-View-ViewModel (MVVM)** architecture and is currently being reworked on the `v2` branch.

This file contains your core, non-negotiable rules. For detailed implementation guidance, refer to the linked documents in the `guidelines` directory.

## 1. The Prime Directive: Respect the MVVM Architecture

The project follows a strict MVVM layered architecture. **Do not violate this structure.**

```
View (widgets) -> ViewModel (ChangeNotifier) -> Repository -> HttpClient -> API
```

- **Views** (`lib/views/`) are "dumb" widgets. They display state and forward user events. They must NOT contain business logic.
- **ViewModels** (`lib/viewmodels/`) hold UI state and logic, extend `ChangeNotifier`, and expose the state the view reads.
- **Repositories** (`lib/repositories/`) are the single source of truth for data and orchestrate HTTP calls. They are `const` classes with constructor injection.
- **Models** (`lib/models/`) are immutable DTOs, mostly generated with `json_serializable`.
- Data flows in **one direction**: UI reads state, sends events to the ViewModel, the ViewModel calls the Repository, then notifies the UI.

For a deeper understanding, read the [Architecture Guide](guidelines/ARCHITECTURE.md).

The UI layer MUST use `context.read<T>()` to trigger events and `context.watch<T>()` to read reactive state. **No global singletons.**

## 2. State Management: Provider + ChangeNotifier

- Dependency injection is handled with the `provider` package. Wire everything in `main.dart` through `MultiProvider`.
- ViewModels extend `ChangeNotifier`; call `notifyListeners()` after mutating state that the UI observes.
- **Do not put logic in widgets.** Widgets only bind to the ViewModel.
- Read the [State Management Guide](guidelines/STATE_MANAGEMENT.md) for details.

## 3. Write Code for Humans (and other AIs)

- Write all code, comments, and documentation in **English**.
- Your code must be readable and self-explanatory. Add comments only when the logic is non-obvious.
- **Reuse existing patterns and conventions.** Before writing new code, understand how similar features are implemented in the project.
- Keep one responsibility per class and function, keep functions short, and do not add premature abstraction.

Refer to the style and convention guides for specifics:
- [Code Style Guide](guidelines/CODE_STYLE.md)
- [Models Guide](guidelines/MODELS.md)
- [API Conventions](guidelines/API_CONVENTIONS.md)
- [Theme Guide](guidelines/THEME.md)

## 4. Security is Not Optional

- Treat **all** external input (responses, query params, user input) as untrusted.
- Validate and sanitize incoming data before use.
- **Never** log sensitive information such as tokens, cookies, or personal identifiers.
- Consult the [Security Guide](guidelines/SECURITY.md) for detailed instructions.

## 5. Testing and Localization

- Tests are written with `Given / When / Then` structure using fakes (subclassing concrete classes).
- UI text goes through `AppLocalizations`; source language is French (`app_fr.arb`).
- Consult the [Testing Guide](guidelines/TESTING.md) and [Localization Guide](guidelines/LOCALIZATION.md).

## 6. Before Submitting Changes

Before concluding your task, ensure:
- The change fits the correct architectural layer (View/ViewModel/Repository/Model).
- Existing patterns and conventions are reused.
- `dart format lib` and `dart analyze lib` pass cleanly.
- No sensitive data is logged.
- Reusable widgets go to `lib/core/widgets/`, not ad-hoc.

Consult the [Performance Guide](guidelines/PERFORMANCE.md) for rules as needed.
