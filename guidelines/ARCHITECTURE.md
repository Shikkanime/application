# Architecture Guide

This project follows **Google's recommended Flutter architecture** (MVVM with Repository pattern). Read the official guide at https://docs.flutter.dev/app-architecture/guide.

## Layer Overview

```
┌──────────────────────────────────────────────────┐
│  UI Layer                                        │
│  ┌──────────┐     ┌──────────────┐              │
│  │  View     │────▶│  ViewModel   │              │
│  │ (widgets) │◀────│ (state/logic)│              │
│  └──────────┘     └──────┬───────┘              │
│                          │                       │
├──────────────────────────┼───────────────────────┤
│  Data Layer              │                       │
│                   ┌──────▼───────┐               │
│                   │  Repository   │              │
│                   │ (source of    │              │
│                   │  truth)       │              │
│                   └──────┬───────┘               │
│                          │                       │
│                   ┌──────▼───────┐               │
│                   │  Service      │              │
│                   │ (API/HTTP)    │              │
│                   └──────────────┘               │
└──────────────────────────────────────────────────┘
```

## Layer Responsibilities

### UI Layer

**Views** (widgets) — Describe how to present data to the user.
- Only layout, animation, and simple routing logic.
- Pass events to the ViewModel via **Commands**.
- No business logic.
- No direct data access.

**ViewModels** — Manage UI state and logic.
- One ViewModel per feature (one-to-one with a View).
- Expose state as `ChangeNotifier` or `ValueNotifier`.
- Expose **Commands** (callback methods) for the View.
- Transform data from Repositories into UI-ready format.
- Depend on Repositories (via `provider` injection).

### Data Layer

**Repositories** — Single source of truth for application data.
- Handle caching, error handling, retry logic.
- Receive data from Services and transform into domain models.
- One Repository class per data type.
- Never depend on each other.
- Expose `Stream` or `Future` for data consumption.

**Services** — Wrap API endpoints and external data sources.
- Hold no state.
- One Service class per data source (e.g., `AnimeApiService`, `MemberApiService`).
- Return raw `Future` or `Stream` response objects.

### Optional: Domain Layer

Use-cases (interactors) can be added when:
- Logic needs to merge data from multiple Repositories.
- The same complex logic is reused by multiple ViewModels.
- ViewModels become too large.

## Dependency Injection

All dependencies are managed via `provider`:
- Services → injected into Repositories
- Repositories → injected into ViewModels
- ViewModels → provided to Views via `ChangeNotifierProvider`

## Naming Conventions

| Component | Naming | Example |
|-----------|--------|---------|
| View | `{Name}Screen` or `{Name}View` | `HomeScreen`, `AnimeDetailsView` |
| ViewModel | `{Name}ViewModel` | `HomeViewModel` |
| Repository | `{Name}Repository` | `AnimeRepository` |
| Service | `{Name}Service` | `AnimeApiService` |
| Model (DTO) | `{Name}Dto` | `AnimeDto` |

## Key Principles

1. **Separation of concerns** — UI and Data layers are strictly separated.
2. **Unidirectional data flow** — Data flows down, events flow up.
3. **Immutable models** — All data models use `freezed` with `copyWith`.
4. **Dependency inversion** — Depend on abstractions, not concretions.