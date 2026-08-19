# API Conventions

Networking is centralized in the `core/network/` layer: a single `HttpClient` and a `sealed class ApiResult<T>`. Repositories build endpoints and map responses.

## ApiResult<T>

Every request returns an `ApiResult<T>`:

- `ApiSuccess<T>(data)` — HTTP 2xx and payload parsed.
- `ApiFailure<T>([error, statusCode])` — non-2xx status or a parse/network error.

```dart
sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess(this.data);
  final T data;
}

class ApiFailure<T> extends ApiResult<T> {
  const ApiFailure([this.error, this.statusCode]);
  final String? error;
  final int? statusCode;
}
```

Because `ApiResult` is `sealed`, consumers handle it with an exhaustive `switch`.

## HttpClient

A single `const HttpClient` wraps `package:http`, builds the URI from `EnvConfig.apiBaseUrl`, enforces a `timeout`, checks the status, and parses JSON.

- Call it as `get<T>(endpoint, queryParameters: {...})`.
- `T` is the **raw parsed type** (`Map<String, dynamic>` or `List<dynamic>`), not the model. JSON is decoded to `Map`/`List`, and `_parseJson` returns `ApiFailure` when the decoded value is not of type `T`.

```dart
final response = await _httpClient.get<Map<String, dynamic>>(
  'v1/animes',
  queryParameters: {
    'country': 'FR',
    if (query != null && query.isNotEmpty) 'name': query,
    'page': page,
    'limit': limit,
  },
);
```

## Repository mapping pattern

Repositories are `const` classes holding an `HttpClient` via constructor injection. They:

1. call `_httpClient.get<T>(...)` with an appropriate raw type (`Map<String, dynamic>` for one object, `List<dynamic>` for a list);
2. `switch` over the returned `ApiResult`;
3. map the raw payload (or the raw list) to typed models through `Model.fromJson(...)`.

```dart
class WeeklyRepository {
  const WeeklyRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<ApiResult<List<WeeklyDayModel>>> getWeekly({
    List<LangType>? langTypes,
  }) async {
    final response = await _httpClient.get<List<dynamic>>(
      'v1/animes/weekly',
      queryParameters: {
        'country': 'FR',
        if (langTypes != null && langTypes.isNotEmpty)
          'searchTypes': langTypes.map((e) => e.name.toUpperCase()).join(','),
      },
    );

    return switch (response) {
      ApiSuccess<List<dynamic>>(:final data) =>
        ApiSuccess<List<WeeklyDayModel>>(
          data.map((e) => WeeklyDayModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ApiFailure<List<dynamic>> failure => ApiFailure<List<WeeklyDayModel>>(
        failure.error,
        failure.statusCode,
      ),
    };
  }
}
```

## Query parameters

- Add query parameters conditionally with collection-`if` so empty/null values are omitted.
- Enums in query params are serialized via `e.name.toUpperCase()` (matching the API contract).
- Always include required API params (e.g. `'country': 'FR'`).

## Guidelines

- Repositories are the **only** layer that talks to `HttpClient`. ViewModels never call `HttpClient` directly.
- Keep methods compact and map results at the repository boundary.
- Endpoints are versioned (`v1/...`); keep them aligned with the API.
- 🌱 To consider for the rework: Flutter officially recommends abstract repository classes for per-environment implementations and separate API vs domain models in large apps. Not required now; concrete `const` repositories are the documented norm.