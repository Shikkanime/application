import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NotificationsType {
  all,
  watchlist,
  none,
}

class NotificationsController {
  static final instance = NotificationsController();
  final String key = 'notificationsType';
  late final SharedPreferences _sharedPreferences;
  final streamController = StreamController<NotificationsType>.broadcast();
  final _messaging = FirebaseMessaging.instance;

  NotificationsType get notificationsType =>
      NotificationsType.values[_sharedPreferences.getInt(key) ?? 0];

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final response = await _messaging.requestPermission();

    if (response.authorizationStatus != AuthorizationStatus.authorized) {
      debugPrint('Notifications are not authorized');
      return;
    }

    if (!_sharedPreferences.containsKey(key)) {
      await setNotificationsType(NotificationsType.watchlist);
    }
  }

  Future<void> setNotificationsType(NotificationsType type) async {
    final futures = <Future>[];
    futures.add(_sharedPreferences.setInt(key, type.index));

    switch (type) {
      case NotificationsType.all:
        futures.addAll([
          _messaging.subscribeToTopic('global'),
          _messaging
              .unsubscribeFromTopic(MemberController.instance.member!.uuid),
        ]);

        break;
      case NotificationsType.watchlist:
        futures.addAll([
          _messaging.unsubscribeFromTopic('global'),
          _messaging.subscribeToTopic(MemberController.instance.member!.uuid),
        ]);

        break;
      case NotificationsType.none:
        futures.addAll([
          _messaging.unsubscribeFromTopic('global'),
          _messaging
              .unsubscribeFromTopic(MemberController.instance.member!.uuid),
        ]);

        break;
    }

    await Future.wait(futures);
    streamController.add(type);
  }
}
