import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    final response = await _messaging.requestPermission(provisional: true);

    if (response.authorizationStatus != AuthorizationStatus.authorized) {
      return;
    }

    if (!_sharedPreferences.containsKey(key)) {
      await setNotificationsType(NotificationsType.all);
    }
  }

  Future<void> setNotificationsType(NotificationsType type) async {
    await _sharedPreferences.setInt(key, type.index);

    switch (type) {
      case NotificationsType.all:
        await _messaging.subscribeToTopic('global');
        await _messaging
            .unsubscribeFromTopic(MemberController.instance.member!.uuid);
        break;
      case NotificationsType.watchlist:
        await _messaging
            .subscribeToTopic(MemberController.instance.member!.uuid);
        await _messaging.unsubscribeFromTopic('global');
        break;
      case NotificationsType.none:
        await _messaging.unsubscribeFromTopic('global');
        await _messaging
            .unsubscribeFromTopic(MemberController.instance.member!.uuid);
        break;
    }

    streamController.add(type);
  }
}
