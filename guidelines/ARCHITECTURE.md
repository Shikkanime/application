# Architecture Guide

The application follows a **Model-View-ViewModel (MVVM)** architecture. Respect the project layers and their dependency direction:

```
View (widgets) -> ViewModel (ChangeNotifier) -> Repository -> HttpClient -> API
```

## Layer responsibilities

### Views (`lib/views/`)
- Widgets are **"dumb"**: they render state and forward user events to the ViewModel.
- The only logic a view may contain is:
  - simple `if` conditions that show/hide a widget based on a flag or nullable field on the ViewModel;
  - layout logic based on device information (screen size, orientation);
  - simple routing logic.
- Views read state with `context.watch<T>()` and trigger events with `context.read<T>()`.

### ViewModels (lib/viewmodels/)
- Hold UI state and the logic that operates on it.
- Extend `ChangeNotifier` (via `package:flutter/foundation.dart`) and call `notifyListeners()` after any mutation the UI observes.
- Orchestrate calls to Repositories; they never perform HTTP or layout work directly.
- Compose other ViewModels by constructor injection (see `AnimeViewModel` which depends on `SimulcastViewModel`).

### Repositories (lib/repositories/)
- **Single source of truth for data.** Repositories isolate the app from the API.
- `const` classes whose constructor receives an `HttpClient`.
- They build endpoints, attach query parameters, execute the HTTP call, and map the raw response to typed models (see the [API Conventions](API_CONVENTIONS.md) for the exact mapping pattern).

### Models (lib/models/)
- Immutable DTOs. Use `final` fields and constructor injection (`AnimeModel(this.uuid, ...)`).
- Marked with `@JsonSerializable`; generated factory logic lives in the sibling `.g.dart` file (`part 'anime_model.g.dart'`).
- See the [Models Guide](MODELS.md).

### Core (lib/core/)
- Shared, reusable code across the app: configuration (`config/`), networking (`network/`), theming (`theme/`), and shared widgets (`widgets/`).
- Reusable widgets live in `lib/core/widgets/`, not ad-hoc inside a screen folder.

## Navigation

The app uses a single `PageView` + `BottomNavigationBar` driven by `NavigationViewModel`. There is no URL router. Use the existing pattern for the app.

- 🌱 To consider for the rework: Flutter officially recommends `go_router` for navigation in most apps. Not required yet; document the existing `PageView` pattern as the norm.

## Repository and models: to consider

- 🌱 Flutter strongly recommends abstract repository classes so different environments (dev/staging) can swap implementations, and generated immutable models (`freezed` / `built_value`). These are **not** required now; the existing concrete repositories (`const` + constructor injection) and `json_serializable` models are the documented norm.

## Project structure (v2)

```
lib/
  main.dart                     # Composition root: MultiProvider + runApp + MaterialApp
  core/
    config/                     # EnvConfig (env-driven values)
    network/                    # HttpClient, ApiResult<T>
    theme/                      # AppTheme, AppThemeExtension, app_theme_colors
    widgets/                    # Shared, reusable widgets (app_*, lang_types/*)
  models/                       # Immutable DTOs + generated .g.dart
  repositories/                 # Concrete repositories (source of truth for data)
  viewmodels/                   # ChangeNotifier view models
  views/                        # Screen widgets + per-screen widgets/
  l10n/                         # Generated localizations (app_localizations, *_fr)
```

`lib/data/` (repositories + services) exists but is **empty**; it is a leftover of the rework in progress. Do not add code there; `lib/repositories/` is the active location.

## Architecture principles (transversal)

- **Single responsibility**: one concern per class/function.
- **No dead or commented-out code.**
- **Unidirectional data flow**: interact from UI to data layer; updates flow back through `ChangeNotifier`.