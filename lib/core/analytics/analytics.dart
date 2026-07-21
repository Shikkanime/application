import 'package:application/core/constants/constant.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Analytics service wrapping Firebase Analytics.
///
/// Tracks user interactions (login, sign-up, screen views, searches, shares,
/// and content selection). All methods are safe to call even when Firebase
/// is not available (no-op fallback).
///
/// Inject this class via `provider` rather than using the singleton pattern.
///
/// {@tool snippet}
/// ```dart
/// final analytics = const Analytics();
/// analytics.logLogin();
/// ```
/// {@end-tool}
class Analytics {
  const Analytics({FirebaseAnalytics? firebase}) : _firebase = firebase;

  /// The underlying Firebase Analytics instance, or null if not available.
  final FirebaseAnalytics? _firebase;

  /// Returns the active Firebase Analytics instance, initializing it on first
  /// access if needed. Returns null on non-mobile platforms or if Firebase
  /// initialization fails.
  FirebaseAnalytics? get _analytics {
    if (_firebase != null) {
      return _firebase;
    }

    if (!kReleaseMode || !Constant.isAndroidOrIOS) {
      return null;
    }

    try {
      final analytics = FirebaseAnalytics.instance;
      analytics.setAnalyticsCollectionEnabled(kReleaseMode);
      return analytics;
    } on Exception catch (e) {
      debugPrint('Error initializing Firebase Analytics: $e');
      return null;
    }
  }

  /// Logs a user login event.
  void logLogin() {
    _analytics?.logLogin();
  }

  /// Logs a user sign-up event with the method 'identifier'.
  void logSignUp() {
    _analytics?.logSignUp(signUpMethod: 'identifier');
  }

  /// Logs a screen view event with the given [screenName].
  void logScreenView(final String screenName) {
    _analytics?.logScreenView(screenName: screenName);
  }

  /// Logs a search event with the given [term] and [parameters].
  void logSearch(final String term, final Map<String, Object> parameters) {
    _analytics?.logSearch(searchTerm: term, parameters: parameters);
  }

  /// Logs a content selection event.
  void logSelectContent(final String contentType, final String itemId) {
    _analytics?.logSelectContent(contentType: contentType, itemId: itemId);
  }

  /// Logs a share event.
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

  /// Logs a custom event with the given [name] and [parameters].
  void log(final String name, final Map<String, Object> parameters) {
    _analytics?.logEvent(name: name, parameters: parameters);
  }
}
