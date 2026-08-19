# State Management Guide

State management is handled by the **MVVM pattern** combined with the **provider** package for dependency injection and `ChangeNotifier`/`Listenable` for reactive updates.

## Dependency injection with provider

- Wire all application dependencies in `lib/main.dart` using `MultiProvider`.
- Dependencies are injected through constructors; never through global singletons or `Static` state.

```dart
MultiProvider(
  providers: [
    Provider(create: (_) => const HttpClient()),
    Provider(
      create: (context) => AnimeRepository(context.read<HttpClient>()),
    ),
    ChangeNotifierProvider(
      create: (context) => AnimeViewModel(
        context.read<AnimeRepository>(),
        context.read<SimulcastViewModel>(),
      ),
    ),
  ],
  child: const MyApp(),
)
```

- **ViewModels** (classes that widgets observe) use `ChangeNotifierProvider` so Dispose is handled by the provider framework.
- **Repositories / services / clients** use plain `Provider`.

## Reading state and triggering events in widgets

- Widgets read reactive state with `context.watch<T>()`. This subscribes the widget to the current value and rebuilds it on `notifyListeners()`.
- Widgets trigger a one-shot event with `context.read<T>()` (do not subscribe).

```dart
Widget build(BuildContext context) {
  final viewModel = context.watch<AnimeViewModel>();
  return Column(/* bind to viewModel */);
}
```

## Notifying the UI

- A ViewModel calls `notifyListeners()` after mutating any state the UI observes (lists, flags, selections, loading state, page index).

```dart
void _setLoading(bool loading) {
  _loading = loading;
  notifyListeners();
}
```

## No logic in widgets

- Widgets must NOT contain business logic. Only:
  - simple conditionals that show/hide based on a ViewModel flag/field;
  - layout logic (screen size / orientation);
  - simple routing.
- All other logic belongs on the ViewModel (`init(bypass:)`, `onChanged(...)`, `setSelectedSimulcast(...)`, etc.).

## Sharing state across ViewModels

- Compose ViewModels: a ViewModel may depend on other ViewModels via constructor injection (`AnimeViewModel` depends on `SimulcastViewModel`).
- Factor shared behavior behind a `Listenable` interface (`LangTypeFilterViewModel`) implemented by multiple ViewModels.

## Controller lifecycle

- Widgets that own a controller (e.g. `ScrollController`) dispose it in their `dispose()` lifecycle, and swap it in `didUpdateWidget` when the injected controller changes. See `app_horizontal_list_view.dart`.
- 🌱 Good practice for the rework (not currently applied across all ViewModels): ViewModels that create controllers (`ScrollController`, `TextEditingController`, `PageController`) may need to own and `dispose()` them when the ViewModel is disposed. This is currently left to the rework; existing code does not yet dispose all ViewModel-held controllers.