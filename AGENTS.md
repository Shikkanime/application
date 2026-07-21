# LLM Agent Instructions — Shikkanime Flutter App

As an AI agent, your primary directive is to adhere to Google's recommended Flutter architecture and the established patterns in this project. Your goal is to write clean, maintainable, testable code that aligns with the Flutter team's best practices.

This file contains your core, non-negotiable rules. For detailed implementation guidance, refer to the linked documents in the `guidelines` directory.

## 1. The Prime Directive: Respect the Architecture

The project follows Google's recommended Flutter architecture (MVVM). **Do not violate this structure.**

```
UI Layer (Views → ViewModels)
    ↕
Data Layer (Repositories → Services)
```

- **Views** contain only layout, animation, and simple routing logic. No business logic.
- **ViewModels** contain UI logic: state management, data transformation, command callbacks.
- **Repositories** are the single source of truth for application data (caching, error handling, retry).
- **Services** wrap API endpoints and external data sources. They hold no state.
- **Business logic belongs only in ViewModels, Repositories, or Use-cases.**
- **Dependency injection** is handled via `provider`.

For a deeper understanding, read the [Architecture Guide](guidelines/ARCHITECTURE.md).

## 2. Immutability & Data Flow

- **Data flows unidirectionally**: Data layer → ViewModel → View.
- **User interactions** flow upward: View → ViewModel command → Repository/Service.
- **All data models must be immutable** (use `freezed` with `copyWith`).
- **Never mutate state directly** in the View layer. State changes must go through the ViewModel.

## 3. Code Style & Quality

- Write all code, comments, and documentation in **English**.
- Follow **Effective Dart** style conventions (the Dart formatter is your baseline).
- **Keep one clear responsibility** per class, function, or file.
- **Reuse existing patterns** before introducing new ones.
- **Keep comments rare, useful, and focused** on non-obvious behavior.
- Only the following lint rules are enforced; do not add new ones without discussion:
  - `prefer_const_constructors`
  - `prefer_const_constructors_in_immutables`
  - `prefer_const_declarations`
  - `prefer_const_literals_to_create_immutables`
  - `prefer_constructors_over_static_methods`

Refer to the [Code Style Guide](guidelines/CODE_STYLE.md) for specifics.

## 4. Testing

- **Every ViewModel, Repository, and Service must have unit tests.**
- Use the **Given / When / Then** pattern.
- Use **fakes** (not mocks) for testing when possible — they make tests more robust.
- Write **widget tests** for Views.

Refer to the [Testing Guide](guidelines/TESTING.md) for details.

## 5. Security is Not Optional

- **Treat all external input as untrusted** (API responses, user input, deep links).
- Validate and sanitize all incoming data before use.
- **Never expose internal details** (stack traces, internal errors) in user-facing messages.
- **Never log sensitive information** like tokens, passwords, or personal data.
- **Never store secrets** in the source code.

Consult the [Security Guide](guidelines/SECURITY.md) for detailed instructions.

## 6. Before Submitting Changes

Before concluding your task, perform a final check:

- [ ] Does the code fit into the correct architectural layer (View / ViewModel / Repository / Service)?
- [ ] Are ViewModels and Views separated? (One ViewModel per feature)
- [ ] Are data models immutable? (freezed, copyWith)
- [ ] Is data flow unidirectional?
- [ ] Is dependency injection used via `provider`?
- [ ] Are all lint rules passing?
- [ ] Are unit tests written for every new class?
- [ ] Is all external data handled securely?
- [ ] Is the code clean, readable, and consistent with existing patterns?