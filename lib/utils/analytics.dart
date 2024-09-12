import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class Analytics {
  static final instance = Analytics();
  FirebaseAnalytics? _analytics;

  Analytics() {
    try {
      _analytics = FirebaseAnalytics.instance;
    } catch (e) {
      debugPrint('Error initializing Firebase Analytics: $e');
    }
  }

  logLogin() {
    _analytics?.logLogin();
  }

  logSignUp() {
    _analytics?.logSignUp(signUpMethod: 'identifier');
  }

  logScreenView(String screenName) {
    _analytics?.logScreenView(screenName: screenName);
  }

  logSearch(String term, Map<String, Object> parameters) {
    _analytics?.logSearch(searchTerm: term, parameters: parameters);
  }

  logSelectContent(String contentType, String itemId) {
    _analytics?.logSelectContent(contentType: contentType, itemId: itemId);
  }

  logShare(String contentType, String itemId, String method) {
    _analytics?.logShare(
        contentType: contentType, itemId: itemId, method: method);
  }

  log(String name, Map<String, Object> parameters) {
    _analytics?.logEvent(name: name, parameters: parameters);
  }
}
