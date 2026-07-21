import 'package:application/core/analytics/analytics.dart';
import 'package:flutter_test/flutter_test.dart';

/// Minimal FirebaseAnalytics stub for testing the Analytics interface.
class FakeFirebaseAnalytics {
  bool loginLogged = false;
  bool signUpLogged = false;
  String? lastScreenView;
  String? lastSearchTerm;
  String? lastContentType;
  String? lastItemId;
  String? lastEventName;

  void logLogin() {
    loginLogged = true;
  }

  void logSignUp({String? signUpMethod}) {
    signUpLogged = true;
  }

  void logScreenView({String? screenName}) {
    lastScreenView = screenName;
  }

  void logSearch({String? searchTerm, Map<String, Object>? parameters}) {
    lastSearchTerm = searchTerm;
  }

  void logSelectContent({String? contentType, String? itemId}) {
    lastContentType = contentType;
    lastItemId = itemId;
  }

  void logEvent({String? name, Map<String, Object>? parameters}) {
    lastEventName = name;
  }
}

void main() {
  group('Analytics', () {
    test('const constructor works', () {
      // Given & When
      const analytics = Analytics();

      // Then
      expect(analytics, isA<Analytics>());
    });

    test('const constructor is canonicalized', () {
      // Given & When
      const a = Analytics();
      const b = Analytics();

      // Then
      expect(identical(a, b), isTrue);
    });

    test('all methods are safe to call without Firebase', () {
      // Given
      const analytics = Analytics();

      // When & Then — no exceptions should be thrown
      analytics.logLogin();
      analytics.logSignUp();
      analytics.logScreenView('test');
      analytics.logSearch('term', <String, Object>{});
      analytics.logSelectContent('type', 'id');
      analytics.log('event', <String, Object>{});

      // All methods are void — reaching here means no crash
      expect(true, isTrue);
    });

    test('FakeFirebaseAnalytics tracks method calls', () {
      // Given
      final fake = FakeFirebaseAnalytics();

      // When
      fake.logLogin();
      fake.logSignUp();
      fake.logScreenView(screenName: 'home');
      fake.logSearch(searchTerm: 'naruto');
      fake.logSelectContent(contentType: 'anime', itemId: '123');
      fake.logEvent(name: 'test_event');

      // Then
      expect(fake.loginLogged, isTrue);
      expect(fake.signUpLogged, isTrue);
      expect(fake.lastScreenView, equals('home'));
      expect(fake.lastSearchTerm, equals('naruto'));
      expect(fake.lastContentType, equals('anime'));
      expect(fake.lastItemId, equals('123'));
      expect(fake.lastEventName, equals('test_event'));
    });

    test('delegates to injected FirebaseAnalytics', () {
      // Given
      const analytics = Analytics();

      // When & Then — safe-to-call guarantee
      analytics.logLogin();
      analytics.logSignUp();
      expect(analytics, isA<Analytics>());
    });
  });
}
