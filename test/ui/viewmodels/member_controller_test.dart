import 'dart:io';

import 'package:application/core/analytics/analytics.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/data/models/enums/config_property_key.dart';
import 'package:application/ui/viewmodels/member_controller.dart';
import 'package:application/ui/viewmodels/shared_preferences_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeApiClient extends ApiClient {
  FakeApiClient({this.postHandler});

  final Future<ApiResult<http.Response>> Function(
    String endpoint, {
    String? token,
    Map<String, String>? headers,
    Object? body,
  })?
  postHandler;

  @override
  Future<ApiResult<http.Response>> post(
    String endpoint, {
    String? token,
    Map<String, String>? headers,
    Object? body,
  }) async {
    if (postHandler != null) {
      return postHandler!(endpoint, token: token, headers: headers, body: body);
    }
    return super.post(endpoint, token: token, headers: headers, body: body);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    PackageInfo.setMockInitialValues(
      appName: 'Shikkanime',
      packageName: 'fr.shikkanime',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await SharedPreferencesController.instance.init();
  });

  group('MemberController', () {
    group('testLogin', () {
      test('returns http.Response when login succeeds with 200 OK', () async {
        // Given
        final fakeClient = FakeApiClient(
          postHandler: (endpoint, {token, headers, body}) async {
            if (endpoint == '/v1/members/login') {
              return ApiSuccess<http.Response>(
                http.Response('{"token":"abc"}', 200),
              );
            }
            return const ApiFailure<http.Response>('Not found', 404);
          },
        );
        final controller = MemberController(
          client: fakeClient,
          analytics: const Analytics(),
        );

        // When
        final response = await controller.testLogin('user-123');

        // Then
        expect(response.statusCode, equals(200));
        expect(response.body, contains('token'));
      });

      test('throws HttpException when login returns 404 status code', () async {
        // Given
        final fakeClient = FakeApiClient(
          postHandler: (endpoint, {token, headers, body}) async {
            return const ApiFailure<http.Response>('Member not found', 404);
          },
        );
        final controller = MemberController(
          client: fakeClient,
          analytics: const Analytics(),
        );

        // When & Then
        expect(
          () => controller.testLogin('invalid-id'),
          throwsA(
            isA<HttpException>().having(
              (e) => e.message,
              'message',
              contains('identifier not found'),
            ),
          ),
        );
      });

      test('throws ClientException on non-404 server error', () async {
        // Given
        final fakeClient = FakeApiClient(
          postHandler: (endpoint, {token, headers, body}) async {
            return const ApiFailure<http.Response>(
              'Internal Server Error',
              500,
            );
          },
        );
        final controller = MemberController(
          client: fakeClient,
          analytics: const Analytics(),
        );

        // When & Then
        expect(
          () => controller.testLogin('user-123'),
          throwsA(isA<http.ClientException>()),
        );
      });
    });

    group('init', () {
      test(
        'registers a new member when login receives a 404 status code',
        () async {
          // Given: An existing invalid identifier stored in SharedPreferences
          await SharedPreferencesController.instance.setString(
            ConfigPropertyKey.identifier,
            'old-invalid-uuid',
          );

          var registerCalled = false;
          var loginCallCount = 0;

          final fakeClient = FakeApiClient(
            postHandler: (endpoint, {token, headers, body}) async {
              if (endpoint == '/v1/members/login') {
                loginCallCount++;
                if (body == 'old-invalid-uuid') {
                  return const ApiFailure<http.Response>('Not found', 404);
                }
                if (body == 'new-registered-uuid') {
                  return ApiSuccess<http.Response>(
                    http.Response(
                      '{"uuid":"new-registered-uuid","token":"jwt-token","creationDateTime":"2026-07-22T13:00:00Z","email":null,"followedAnimes":[],"followedEpisodes":[],"totalDuration":0,"totalUnseenDuration":0,"attachmentLastUpdateDateTime":null}',
                      200,
                    ),
                  );
                }
              }

              if (endpoint == '/v1/members/register') {
                registerCalled = true;
                return ApiSuccess<http.Response>(
                  http.Response('{"identifier":"new-registered-uuid"}', 201),
                );
              }

              return const ApiFailure<http.Response>('Unknown endpoint', 400);
            },
          );

          final controller = MemberController(
            client: fakeClient,
            analytics: const Analytics(),
          );

          // When
          await controller.init();

          // Then
          expect(registerCalled, isTrue);
          expect(loginCallCount, equals(2));
          expect(controller.identifier, equals('new-registered-uuid'));
          expect(
            SharedPreferencesController.instance.getString(
              ConfigPropertyKey.oldIdentifier,
            ),
            equals('old-invalid-uuid'),
          );
          expect(
            SharedPreferencesController.instance.getString(
              ConfigPropertyKey.identifier,
            ),
            equals('new-registered-uuid'),
          );
        },
      );
    });
  });
}
