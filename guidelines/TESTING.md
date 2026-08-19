# Testing Guide

This guide defines the conventions for writing tests in this application. All test code, names, and comments are written in **English**.

> **Status note:** there is currently no `test/` directory in `v2`. This guide is **aspirational**: it sets the conventions to apply as tests are introduced (during the rework). Follow it when adding tests.

## Core stack

- **`flutter_test`** (SDK) — the primary framework, alongside `package:test`.
- **Fakes by subclassing** — because repositories and `HttpClient` are concrete `const` classes (by design, no abstraction imposed), tests build **fakes that override the methods** of the real concrete classes. There is no mock framework requirement implied by the architecture.

## How to inject fakes

- **Unit tests for ViewModels**: inject a fake Repository. Since repositories are concrete classes, create a subclass that overrides the data methods.

```dart
class FakeAnimeRepository extends AnimeRepository {
  FakeAnimeRepository() : super(const HttpClient());

  @override
  Future<ApiResult<PageableModel<AnimeModel>>> getAnimes(
    int page,
    int limit, {
    String? query,
    String? simulcast,
    List<LangType>? langTypes,
  }) async {
    // return canned ApiSuccess / ApiFailure data
  }
}
```

- **Unit tests for Repositories**: inject a fake `HttpClient` that overrides `get<T>(...)` to return canned maps/lists, then assert the repository mapping.

## Test structure

- Use the **`Given / When / Then`** pattern, with comments delineating the three sections.
- Structure each test as:
  - `// Given` — setup: build the fake, configure the state under test;
  - `// When` — act: invoke the method / trigger the event;
  - `// Then` — assert: verify the resulting state / calls.

```dart
test('reload keeps current data when called with bypass', () async {
  // Given
  final viewModel = WeeklyViewModel(FakeWeeklyRepository());

  // When
  await viewModel.init(bypass: true);

  // Then
  expect(viewModel.length, greaterThan(0));
});
```

## Unit tests

- **Test every ViewModel method** in isolation (init, selection updates, pagination, error handling).
- **Test every Repository method**: with a fake `HttpClient`, verify the correct endpoint is requested, the right query parameters are attached, and the raw payload maps to the typed models.

## Widget tests

- Build views inside a **Provider harness** (`ChangeNotifierProvider.value` / `MultiProvider`) that provides a fake-injected ViewModel.
- Verify rendering, correct state binding, and that events trigger the expected ViewModel calls.

```dart
testWidgets('shows the search bar', (tester) async {
  await tester.pumpWidget(
    ChangeNotifierProvider<AnimeViewModel>.value(
      value: AnimeViewModel(FakeAnimeRepository(), FakeSimulcastViewModel()),
      child: const CatalogView(),
    ),
  );
  // Then: find the SearchBar
});
```

## What to cover

- ViewModels: every public method, success and failure branches, loading state transitions.
- Repositories: endpoint, query params, mapping for success and failure.
- Widgets: key rendering states (data, empty, loading/skeleton) and interactions.
- Always exercise the **failure branches** (`ApiFailure`) to confirm error paths do not crash.