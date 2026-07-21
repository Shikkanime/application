# API Conventions

## API Client

All HTTP calls go through a centralized API client (`ApiClient`) that handles:
- Base URL configuration
- Authentication headers (token injection)
- Error handling and mapping to `ApiResult`
- Timeout management
- Request/response logging (debug only)

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

## Response Handling

Use the `Result` pattern (recommended by Google) instead of raw exceptions:

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

## Error Handling

- **Map HTTP errors to meaningful types** in the Repository layer.
- **401 Unauthorized** → trigger token refresh or re-login.
- **404 Not Found** → return empty data, not an error.
- **5xx Server Error** → retry with exponential backoff (max 3 attempts).
- **Network errors** → return cached data if available, otherwise propagate the error.

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