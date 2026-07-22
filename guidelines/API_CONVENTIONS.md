# API Conventions

## API Client

All HTTP calls go through a centralized API client (`ApiClient`) that handles:
- Base URL configuration
- Authentication headers (token injection)
- Error handling and mapping to `ApiResult`
- Timeout management
- Request/response logging (debug only)

### REST Standards Compliance
- **HTTP 2xx (200-299)**: Mapped to `ApiSuccess<T>`. All 2xx codes (`200 OK`, `201 Created`, `204 No Content`) indicate success.
- **HTTP 4xx & 5xx**: Mapped to `ApiFailure<T>(errorMessage, statusCode)`. Non-2xx status codes are **NEVER** returned as `ApiSuccess`.
- **Never pattern match `ApiSuccess` with non-2xx status codes**: It is strictly forbidden to write `case ApiSuccess() when data.statusCode == 404` or `409`. Non-2xx codes are guaranteed to be `ApiFailure`.

## Request Pattern

```dart
// Service layer
class AnimeApiService {
  const AnimeApiService(this._client);

  final ApiClient _client;

  Future<ApiResult<List<AnimeDto>>> fetchAnimes({
    required String country,
    String? simulcast,
    int page = 1,
    int limit = 20,
  }) =>
      _client.get(
        '/v1/animes',
        queryParameters: {
          'country': country,
          if (simulcast != null) 'simulcast': simulcast,
          'page': '$page',
          'limit': '$limit',
        },
      );
}
```

## Response Handling & Pattern Matching

Use the `Result` pattern (recommended by Google) with Dart 3 exhaustive pattern matching and `HttpStatus` constants:

```dart
sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess(this.data);
  final T data;
}

class ApiFailure<T> extends ApiResult<T> {
  const ApiFailure(this.error, [this.statusCode]);
  final String error;
  final int? statusCode;
}
```

### Pattern Matching Guidelines
- **Use `HttpStatus` constants**: Always use `HttpStatus.unauthorized`, `HttpStatus.notFound`, `HttpStatus.conflict` instead of magic numbers (`401`, `404`, `409`).
- **Clean Exhaustive Switch**:
  ```dart
  return switch (result) {
    ApiSuccess<http.Response>(:final data) => data,
    ApiFailure<http.Response>(:final statusCode)
        when statusCode == HttpStatus.notFound =>
      throw const HttpException('Resource not found'),
    ApiFailure<http.Response>(:final error) => throw http.ClientException(error),
  };
  ```

## Error Handling & Retry Logic

- **401 Unauthorized**: Retried automatically with refreshed session/token.
- **Immutable Retry State**: Do **NOT** use class-level mutable booleans (e.g. `_isRetry`) for retry logic. Pass an explicit immutable parameter `{final bool isRetry = false}` in recursive retry methods.
  ```dart
  Future<void> updateData({final bool isRetry = false}) async {
    final result = await _client.post(...);
    switch (result) {
      case ApiFailure(:final statusCode) when statusCode == HttpStatus.unauthorized:
        if (isRetry) {
          throw Exception('Unauthorized after retry');
        }
        await login();
        return updateData(isRetry: true);
      case ApiSuccess():
        // handle success
    }
  }
  ```

## Refactoring Rules

- **No `@Deprecated` / No Legacy Aliases**: When refactoring code, do **NOT** create or maintain `@Deprecated` methods or legacy wrapper functions. Migrate and break old code directly across the project.
- **Always run `dart format .`**: Format all modified files with `dart format` after every code change.

## DTOs (Data Transfer Objects)

- All DTOs are **immutable** (`freezed` + `json_serializable`).
- One DTO per API response structure.
- DTOs are converted to domain models in the Repository layer.
- Keep DTOs separate from UI models.

```dart
@freezed
class AnimeDto with _$AnimeDto {
  const factory AnimeDto({
    required String uuid,
    required String name,
    @JsonKey(name: 'slug') String? slug,
    required String? synopsis,
  }) = _AnimeDto;

  factory AnimeDto.fromJson(Map<String, dynamic> json) =>
      _$AnimeDtoFromJson(json);
}
```