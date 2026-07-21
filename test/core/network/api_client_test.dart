import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('ApiClient', () {
    test('const constructor works with default timeout', () {
      // Given & When
      const defaultClient = ApiClient();

      // Then
      expect(defaultClient.timeout, equals(const Duration(seconds: 10)));
    });

    test('custom timeout is accepted', () {
      // Given & When
      const fastClient = ApiClient(timeout: Duration(seconds: 5));

      // Then
      expect(fastClient.timeout, equals(const Duration(seconds: 5)));
    });
  });

  group('ApiResult', () {
    group('ApiSuccess', () {
      test('holds data correctly', () {
        // Given
        const success = ApiSuccess<int>(42);

        // Then
        expect(success.data, equals(42));
      });

      test('toString returns ApiSuccess(data)', () {
        // Given
        const success = ApiSuccess<String>('hello');

        // When & Then
        expect(success.toString(), equals('ApiSuccess(hello)'));
      });

      test('switch on success returns data', () {
        // Given
        const ApiResult<int> result = ApiSuccess<int>(42);

        // When
        final value = switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>() => 0,
        };

        // Then
        expect(value, equals(42));
      });
    });

    group('ApiFailure', () {
      test('holds error message and status code', () {
        // Given
        const failure = ApiFailure<String>('Not found', 404);

        // Then
        expect(failure.error, equals('Not found'));
        expect(failure.statusCode, equals(404));
      });

      test('statusCode is null when not provided', () {
        // Given
        const failure = ApiFailure<String>('Unknown error');

        // Then
        expect(failure.error, equals('Unknown error'));
        expect(failure.statusCode, isNull);
      });

      test('toString returns ApiFailure(statusCode: error)', () {
        // Given
        const failure = ApiFailure<String>('Server error', 500);

        // When & Then
        expect(failure.toString(), equals('ApiFailure(500: Server error)'));
      });

      test('switch on failure returns fallback', () {
        // Given
        const ApiResult<int> result = ApiFailure<int>('error', 500);

        // When
        final value = switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>(:final statusCode) when statusCode == 500 => -1,
          ApiFailure<int>() => 0,
        };

        // Then
        expect(value, equals(-1));
      });

      test('switch on failure without status code', () {
        // Given
        const ApiResult<int> result = ApiFailure<int>('error');

        // When
        final value = switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>() => 0,
        };

        // Then
        expect(value, equals(0));
      });
    });
  });

  group('ApiResult with http.Response', () {
    test('ApiSuccess with 200 response', () {
      // Given
      final response = http.Response('{"key":"value"}', 200);

      // When
      final success = ApiSuccess<http.Response>(response);

      // Then
      expect(success.data.statusCode, equals(200));
      expect(success.data.body, equals('{"key":"value"}'));
    });

    test('ApiFailure with 401 is properly structured', () {
      // Given
      const failure = ApiFailure<http.Response>('Unauthorized', 401);

      // Then
      expect(failure.error, equals('Unauthorized'));
      expect(failure.statusCode, equals(401));
    });

    test('ApiFailure with network error', () {
      // Given
      const failure = ApiFailure<http.Response>('Network error: refused');

      // Then
      expect(failure.error, contains('Network error'));
      expect(failure.statusCode, isNull);
    });

    test('switch on http.Response ApiResult handles all cases', () {
      // Given
      final List<ApiResult<http.Response>> results = [
        ApiSuccess<http.Response>(http.Response('ok', 200)),
        const ApiFailure<http.Response>('error', 500),
      ];

      // When
      final statusCodes = results.map((result) {
        return switch (result) {
          ApiSuccess<http.Response>(:final data) => data.statusCode,
          ApiFailure<http.Response>(:final statusCode) => statusCode ?? 0,
        };
      }).toList();

      // Then
      expect(statusCodes, equals([200, 500]));
    });
  });

  group('ApiResult pattern matching exhaustiveness', () {
    test('int ApiResult is exhaustive', () {
      // Given
      final List<ApiResult<int>> results = [
        const ApiSuccess<int>(1),
        const ApiFailure<int>('error'),
      ];

      // When
      final values = results.map((result) {
        return switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>() => 0,
        };
      }).toList();

      // Then
      expect(values, equals([1, 0]));
    });

    test('String ApiResult is exhaustive', () {
      // Given
      final List<ApiResult<String>> results = [
        const ApiSuccess<String>('value'),
        const ApiFailure<String>('error'),
      ];

      // When
      final values = results.map((result) {
        return switch (result) {
          ApiSuccess<String>(:final data) => data,
          ApiFailure<String>(:final error) => error,
        };
      }).toList();

      // Then
      expect(values, equals(['value', 'error']));
    });
  });
}
