import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('ApiClient', () {
    test('const constructor works with default timeout', () {
      const defaultClient = ApiClient();
      expect(defaultClient.timeout, equals(const Duration(seconds: 10)));
    });

    test('custom timeout is accepted', () {
      const fastClient = ApiClient(timeout: Duration(seconds: 5));
      expect(fastClient.timeout, equals(const Duration(seconds: 5)));
    });
  });

  group('ApiResult', () {
    group('ApiSuccess', () {
      test('holds data correctly', () {
        const success = ApiSuccess<int>(42);
        expect(success.data, equals(42));
      });

      test('toString returns ApiSuccess(data)', () {
        const success = ApiSuccess<String>('hello');
        expect(success.toString(), equals('ApiSuccess(hello)'));
      });

      test('switch on success returns data', () {
        const ApiResult<int> result = ApiSuccess<int>(42);

        final value = switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>() => 0,
        };

        expect(value, equals(42));
      });
    });

    group('ApiFailure', () {
      test('holds error message and status code', () {
        const failure = ApiFailure<String>('Not found', 404);
        expect(failure.error, equals('Not found'));
        expect(failure.statusCode, equals(404));
      });

      test('statusCode is null when not provided', () {
        const failure = ApiFailure<String>('Unknown error');
        expect(failure.error, equals('Unknown error'));
        expect(failure.statusCode, isNull);
      });

      test('toString returns ApiFailure(statusCode: error)', () {
        const failure = ApiFailure<String>('Server error', 500);
        expect(
          failure.toString(),
          equals('ApiFailure(500: Server error)'),
        );
      });

      test('switch on failure returns fallback', () {
        const ApiResult<int> result = ApiFailure<int>('error', 500);

        final value = switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>(:final statusCode) when statusCode == 500 => -1,
          ApiFailure<int>() => 0,
        };

        expect(value, equals(-1));
      });

      test('switch on failure without status code', () {
        const ApiResult<int> result = ApiFailure<int>('error');

        final value = switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>() => 0,
        };

        expect(value, equals(0));
      });
    });
  });

  group('ApiResult with http.Response', () {
    test('ApiSuccess with 200 response', () {
      final response = http.Response('{"key":"value"}', 200);
      final success = ApiSuccess<http.Response>(response);
      expect(success.data.statusCode, equals(200));
      expect(success.data.body, equals('{"key":"value"}'));
    });

    test('ApiFailure with 401 is properly structured', () {
      const failure = ApiFailure<http.Response>('Unauthorized', 401);
      expect(failure.error, equals('Unauthorized'));
      expect(failure.statusCode, equals(401));
    });

    test('ApiFailure with network error', () {
      const failure = ApiFailure<http.Response>('Network error: refused');
      expect(failure.error, contains('Network error'));
      expect(failure.statusCode, isNull);
    });

    test('switch on http.Response ApiResult handles all cases', () {
      final List<ApiResult<http.Response>> results = [
        ApiSuccess<http.Response>(http.Response('ok', 200)),
        const ApiFailure<http.Response>('error', 500),
      ];

      final statusCodes = results.map((result) {
        return switch (result) {
          ApiSuccess<http.Response>(:final data) => data.statusCode,
          ApiFailure<http.Response>(:final statusCode) => statusCode ?? 0,
        };
      }).toList();

      expect(statusCodes, equals([200, 500]));
    });
  });

  group('ApiResult pattern matching exhaustiveness', () {
    test('int ApiResult is exhaustive', () {
      final List<ApiResult<int>> results = [
        const ApiSuccess<int>(1),
        const ApiFailure<int>('error'),
      ];

      final values = results.map((result) {
        return switch (result) {
          ApiSuccess<int>(:final data) => data,
          ApiFailure<int>() => 0,
        };
      }).toList();

      expect(values, equals([1, 0]));
    });

    test('String ApiResult is exhaustive', () {
      final List<ApiResult<String>> results = [
        const ApiSuccess<String>('value'),
        const ApiFailure<String>('error'),
      ];

      final values = results.map((result) {
        return switch (result) {
          ApiSuccess<String>(:final data) => data,
          ApiFailure<String>(:final error) => error,
        };
      }).toList();

      expect(values, equals(['value', 'error']));
    });
  });
}