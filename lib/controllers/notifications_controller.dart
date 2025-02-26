import 'dart:async';

import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/views/request_notification_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

enum NotificationsType { all, watchlist, none }

class NotificationsController {
  static final NotificationsController instance = NotificationsController();

  static const String _keyNotificationsType = 'notificationsType';
  static const String _topicGlobal = 'global';

  final StreamController<NotificationsType> streamController =
      StreamController<NotificationsType>.broadcast();
  FirebaseMessaging? _messaging;
  NotificationsType? tmpNotificationsType;

  static bool get isSupported => Constant.isAndroidOrIOS;

  NotificationsType get notificationsType =>
      NotificationsType.values[SharedPreferencesController.instance.getInt(
            _keyNotificationsType,
          ) ??
          0];

  Future<void> init(final BuildContext context) async {
    if (!isSupported) {
      await _setAndIgnore(NotificationsType.none);
      return;
    }

    _messaging = FirebaseMessaging.instance;
    await _createNotificationChannel();

    // TODO(Ziedelth): Remove this line later
    await _messaging?.unsubscribeFromTopic('dev');

    if (SharedPreferencesController.instance.containsKey(
      _keyNotificationsType,
    )) {
      debugPrint('Notifications type already set');
      return;
    }

    if (!context.mounted) {
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder:
            (final BuildContext context) => const RequestNotificationView(),
      ),
    );

    if (tmpNotificationsType == null) {
      debugPrint('Notifications type not set');
      await _setAndIgnore(NotificationsType.none);
      return;
    }

    final NotificationSettings? settings =
        await _messaging?.requestPermission();

    if (settings?.authorizationStatus != AuthorizationStatus.authorized) {
      debugPrint('Notifications are not authorized');
      await _setAndIgnore(NotificationsType.none);
      return;
    }

    await setNotificationsType(tmpNotificationsType!);
  }

  Future<bool> setNotificationsType(final NotificationsType type) async {
    if (_messaging == null || !isSupported) {
      await _setAndIgnore(type);
      return false;
    }

    final NotificationSettings settings = await _messaging!.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      debugPrint('Notifications are not authorized');
      return false;
    }

    final MemberDto? member = MemberController.instance.member;
    if (member == null) {
      debugPrint('Member not connected, impossible to configure notifications');
      return false;
    }

    await SharedPreferencesController.instance.setInt(
      _keyNotificationsType,
      type.index,
    );

    switch (type) {
      case NotificationsType.all:
        await _messaging!.subscribeToTopic(_topicGlobal);
        await _messaging!.unsubscribeFromTopic(member.uuid);
      case NotificationsType.watchlist:
        await _messaging!.unsubscribeFromTopic(_topicGlobal);
        await _messaging!.subscribeToTopic(member.uuid);
      case NotificationsType.none:
        await _messaging!.unsubscribeFromTopic(_topicGlobal);
        await _messaging!.unsubscribeFromTopic(member.uuid);
    }

    streamController.add(type);
    return true;
  }

  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  Future<void> _setAndIgnore(final NotificationsType type) async {
    await SharedPreferencesController.instance.setInt(
      _keyNotificationsType,
      type.index,
    );
    streamController.add(type);
  }
}
