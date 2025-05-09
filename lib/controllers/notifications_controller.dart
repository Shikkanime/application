import 'dart:async';
import 'dart:convert';

import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/enums/config_property_key.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/dtos/member_notification_settings_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/views/request_notification_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

enum NotificationsType { all, watchlist, none }

class NotificationsController {
  static final NotificationsController instance = NotificationsController();

  static const String _topicGlobal = 'global';

  final StreamController<NotificationsType> typeStreamController =
      StreamController<NotificationsType>.broadcast();
  final StreamController<List<PlatformDto>> platformStreamController =
      StreamController<List<PlatformDto>>.broadcast();
  FirebaseMessaging? _messaging;
  NotificationsType? tmpNotificationsType;

  static bool get isSupported => Constant.isAndroidOrIOS;

  NotificationsType get notificationsType =>
      NotificationsType.values[SharedPreferencesController.instance.getInt(
            ConfigPropertyKey.notificationsType,
          ) ??
          0];

  Future<void> init(final BuildContext context) async {
    if (!isSupported) {
      if (!SharedPreferencesController.instance.containsKey(
        ConfigPropertyKey.notificationsType,
      )) {
        await _setAndIgnore(NotificationsType.none);
      }

      return;
    }

    _messaging = FirebaseMessaging.instance;
    await _createNotificationChannel();

    if (SharedPreferencesController.instance.containsKey(
      ConfigPropertyKey.notificationsType,
    )) {
      debugPrint('Notifications type already set');

      if (MemberController.instance.member!.notificationSettings == null) {
        debugPrint('Member notification settings not set, sending request');
        await _setAndIgnore(NotificationsType.none);
        return;
      }

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
      ConfigPropertyKey.notificationsType,
      type.index,
    );

    await _post(type: type);

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

    typeStreamController.add(type);
    platformStreamController.add(
      MemberController.instance.member!.notificationSettings?.platforms ??
          <PlatformDto>[],
    );
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
      ConfigPropertyKey.notificationsType,
      type.index,
    );

    await _post(type: type);

    typeStreamController.add(type);
    platformStreamController.add(
      MemberController.instance.member!.notificationSettings?.platforms ??
          <PlatformDto>[],
    );
  }

  Future<void> _post({
    final NotificationsType? type,
    final List<PlatformDto> platforms = const <PlatformDto>[],
  }) async {
    await HttpRequest.instance.post(
      '/v1/members/notification-settings',
      token: MemberController.instance.member!.token,
      body: jsonEncode(
        MemberNotificationSettingsDto(
          type: (type ?? notificationsType).name.toUpperCase(),
          platforms: platforms,
        ).toJson(),
      ),
    );
  }

  Future<void> togglePlatform(final PlatformDto platform) async {
    final MemberDto? member = MemberController.instance.member;

    if (member == null) {
      debugPrint('Member not connected, impossible to configure notifications');
      return;
    }

    final List<PlatformDto> platforms =
        member.notificationSettings?.platforms ?? <PlatformDto>[];

    if (platforms.any((final PlatformDto p) => p.id == platform.id)) {
      platforms.removeWhere((final PlatformDto p) => p.id == platform.id);
    } else {
      platforms.add(platform);
    }

    await _post(platforms: platforms);

    platformStreamController.add(platforms);
  }
}
