import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NotificationsType {
  all,
  watchlist,
  none,
}

class NotificationsController {
  static final instance = NotificationsController();
  late final SharedPreferences _sharedPreferences;
  final streamController = StreamController<NotificationsType>.broadcast();

  NotificationsType get notificationsType => NotificationsType
      .values[_sharedPreferences.getInt('notificationsType') ?? 0];

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final response =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

    if (response.authorizationStatus != AuthorizationStatus.authorized) {
      return;
    }

    if (!_sharedPreferences.containsKey('notificationsType')) {
      await setNotificationsType(NotificationsType.all);
    }
  }

  Future<void> setNotificationsType(NotificationsType type) async {
    await _sharedPreferences.setInt('notificationsType', type.index);

    switch (type) {
      case NotificationsType.all:
        await FirebaseMessaging.instance.subscribeToTopic('global');
        await FirebaseMessaging.instance
            .unsubscribeFromTopic(MemberController.instance.member!.uuid);
        break;
      case NotificationsType.watchlist:
        await FirebaseMessaging.instance
            .subscribeToTopic(MemberController.instance.member!.uuid);
        await FirebaseMessaging.instance.unsubscribeFromTopic('global');
        break;
      case NotificationsType.none:
        await FirebaseMessaging.instance.unsubscribeFromTopic('global');
        await FirebaseMessaging.instance
            .unsubscribeFromTopic(MemberController.instance.member!.uuid);
        break;
    }

    streamController.add(type);
  }
}
