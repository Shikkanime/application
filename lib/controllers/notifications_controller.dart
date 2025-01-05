import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/utils/constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

enum NotificationsType {
  watchlist,
  all,
  none,
}

class NotificationsController {
  static final NotificationsController instance = NotificationsController();
  final String key = 'notificationsType';
  final StreamController<NotificationsType> streamController =
      StreamController<NotificationsType>.broadcast();
  FirebaseMessaging? _messaging;

  NotificationsType get notificationsType => NotificationsType
      .values[SharedPreferencesController.instance.getInt(key) ?? 0];

  Future<void> init() async {
    if (!Constant.isAndroidOrIOS) {
      if (!SharedPreferencesController.instance.containsKey(key)) {
        await setNotificationsType(NotificationsType.none);
      }

      return;
    }

    _messaging = FirebaseMessaging.instance;

    if (SharedPreferencesController.instance.containsKey(key)) {
      debugPrint('Notifications type already set');
      return;
    }

    final NotificationSettings? response =
        await _messaging?.requestPermission();

    if (response?.authorizationStatus != AuthorizationStatus.authorized) {
      debugPrint('Notifications are not authorized');
      await SharedPreferencesController.instance
          .setInt(key, NotificationsType.none.index);
      return;
    }

    if (!SharedPreferencesController.instance.containsKey(key)) {
      await setNotificationsType(NotificationsType.watchlist);
    }
  }

  Future<bool> setNotificationsType(final NotificationsType type) async {
    if (_messaging == null || !Constant.isAndroidOrIOS) {
      await SharedPreferencesController.instance.setInt(key, type.index);
      return false;
    }

    final NotificationSettings response = await _messaging!.requestPermission();

    if (response.authorizationStatus != AuthorizationStatus.authorized) {
      debugPrint('Notifications are not authorized');
      return false;
    }

    final List<Future<void>> futures = <Future<void>>[
      SharedPreferencesController.instance.setInt(key, type.index),
    ];

    switch (type) {
      case NotificationsType.all:
        futures.addAll(<Future<void>>[
          _messaging!.subscribeToTopic('global'),
          _messaging!
              .unsubscribeFromTopic(MemberController.instance.member!.uuid),
        ]);
      case NotificationsType.watchlist:
        futures.addAll(<Future<void>>[
          _messaging!.unsubscribeFromTopic('global'),
          _messaging!.subscribeToTopic(MemberController.instance.member!.uuid),
        ]);
      case NotificationsType.none:
        futures.addAll(<Future<void>>[
          _messaging!.unsubscribeFromTopic('global'),
          _messaging!
              .unsubscribeFromTopic(MemberController.instance.member!.uuid),
        ]);
    }

    await Future.wait(futures);
    streamController.add(type);
    return true;
  }
}
