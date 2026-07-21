/// Result type for API operations.
///
/// Wraps either a successful [T] value or a failure with an error message
/// and optional HTTP status code. Use this instead of raw exceptions
/// for predictable error handling, as recommended by the Flutter team.
sealed class ApiResult<T> {
  const ApiResult();
}

/// Successful API result containing [data] of type [T].
class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess(this.data);

  final T data;

  @override
  String toString() => 'ApiSuccess($data)';
}

/// Failed API result containing an [error] message and optional [statusCode].
class ApiFailure<T> extends ApiResult<T> {
  const ApiFailure(this.error, [this.statusCode]);

  final String error;
  final int? statusCode;

  @override
  String toString() => 'ApiFailure($statusCode: $error)';
}
