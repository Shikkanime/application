# Testing Guide

All tests must be written in English.

## Core Libraries

- **`flutter_test`** — The primary test framework (built into Flutter SDK).
- **[mocktail](https://pub.dev/packages/mocktail)** — For creating mocks and verifying interactions.
- **[fake_async](https://pub.dev/packages/fake_async)** — For testing async code deterministically.

## Test Structure

### 1. Organize by Feature

Mirror the `lib/` structure in `test/`:

```
test/
├── ui/
│   ├── home/
│   │   ├── home_view_test.dart
│   │   └── home_view_model_test.dart
│   └── anime_details/
│       └── anime_details_view_model_test.dart
├── data/
│   ├── repositories/
│   │   └── anime_repository_test.dart
│   └── services/
│       └── anime_service_test.dart
```

### 2. Group Tests with `group`

```dart
group('HomeViewModel', () {
  group('fetchAnimes', () {
    test('should return animes when repository succeeds', () async {
      // ...
    });
  });
});
```

### 3. Use Descriptive Names

Test names must be complete sentences describing the expected outcome:

```dart
test('should return list of animes when repository call succeeds', () async { ... });
test('should throw ApiException when network fails', () async { ... });
```

### 4. Follow the Given/When/Then Pattern

```dart
test('should return animes when repository succeeds', () async {
  // Given
  when(() => repository.fetchAll()).thenAnswer((_) async => [animeDto]);

  // When
  final result = await viewModel.fetchAnimes();

  // Then
  expect(result, isA<List<AnimeDto>>());
  verify(() => repository.fetchAll()).called(1);
});
```

## Testing by Layer

### ViewModels

- Test state transitions (loading, success, error).
- Test that commands produce correct state changes.
- Test error handling paths.
- Use `ChangeNotifier` to listen for state changes.

```dart
test('should update state to loading then success', () async {
  final viewModel = HomeViewModel(repository: fakeRepository);
  expect(viewModel.state, equals(HomeState.initial));

  await viewModel.fetchAnimes();

  expect(viewModel.state, equals(HomeState.success));
  expect(viewModel.animes.isNotEmpty, isTrue);
});
```

### Repositories

- Test caching logic.
- Test error handling and retry behaviour.
- Test data transformation (raw DTO → domain model).

### Services

- Test that correct HTTP calls are made (method, URL, headers, body).
- Test response parsing.
- Test error handling for different HTTP status codes.

### Views (Widget Tests)

- Test that the correct widgets are rendered for each state.
- Test that user interactions trigger the correct ViewModel commands.
- Test navigation and routing.
- Use `pumpAndSettle()` for async widget updates.

## Fakes vs Mocks

**Prefer fakes over mocks** when possible:

```dart
class FakeAnimeRepository extends Fake implements AnimeRepository {
  @override
  Future<List<AnimeDto>> fetchAll() async => [animeDto];
}
```

Fakes are more robust because they don't break when the interface changes. Use `mocktail` only when you need to verify specific interactions (e.g., `verify` calls).

## Test Coverage Requirements

| Layer | Coverage Target | Notes |
|-------|----------------|-------|
| ViewModels | 100% | All state transitions, edge cases, error paths |
| Repositories | 100% | Cache, errors, data transformation |
| Services | 80% | HTTP calls, response parsing |
| Views | 60% | Key states, user interactions, navigation |