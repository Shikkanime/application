sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess(this.data);

  final T data;

  @override
  String toString() => 'ApiSuccess($data)';
}

class ApiFailure<T> extends ApiResult<T> {
  const ApiFailure([this.error, this.statusCode]);

  final String? error;
  final int? statusCode;

  @override
  String toString() => 'ApiFailure($statusCode: $error)';
}
