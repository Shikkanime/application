import 'package:application/utils/constant.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class Analytics {
  Analytics() {
    if (!kReleaseMode || !Constant.isAndroidOrIOS) {
      return;
    }

    try {
      _analytics = FirebaseAnalytics.instance;
      _analytics?.setAnalyticsCollectionEnabled(kReleaseMode);
    } on Exception catch (e) {
      debugPrint('Error initializing Firebase Analytics: $e');
    }
  }

  static final Analytics instance = Analytics();
  FirebaseAnalytics? _analytics;

  void logLogin() {
    _analytics?.logLogin();
  }

  void logSignUp() {
    _analytics?.logSignUp(signUpMethod: 'identifier');
  }

  void logScreenView(final String screenName) {
    _analytics?.logScreenView(screenName: screenName);
  }

  void logSearch(final String term, final Map<String, Object> parameters) {
    _analytics?.logSearch(searchTerm: term, parameters: parameters);
  }

  void logSelectContent(final String contentType, final String itemId) {
    _analytics?.logSelectContent(contentType: contentType, itemId: itemId);
  }

  void logShare(
    final String contentType,
    final String itemId,
    final String method,
  ) {
    _analytics?.logShare(
      contentType: contentType,
      itemId: itemId,
      method: method,
    );
  }

  void log(final String name, final Map<String, Object> parameters) {
    _analytics?.logEvent(name: name, parameters: parameters);
  }
}
