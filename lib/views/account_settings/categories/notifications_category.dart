import 'package:application/components/platforms/platform_component.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/controllers/platform_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/views/account_settings/settings_category.dart';
import 'package:application/views/account_settings/settings_option.dart';
import 'package:flutter/material.dart';

class NotificationsCategory extends StatefulWidget {
  const NotificationsCategory({super.key, this.member});

  final MemberDto? member;

  @override
  State<StatefulWidget> createState() => _NotificationsCategoryState();
}

class _NotificationsCategoryState extends State<NotificationsCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      PlatformController.instance.init();
    });
  }

  @override
  Widget build(final BuildContext context) => SettingsCategory(
    icon: Icons.notifications,
    title: AppLocalizations.of(context)!.notifications,
    separator: true,
    options: <Widget>[
      StreamBuilder<NotificationsType>(
        stream: NotificationsController.instance.typeStreamController.stream,
        initialData: NotificationsController.instance.notificationsType,
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<NotificationsType> snapshot,
            ) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final NotificationsType type in NotificationsType.values)
                  SettingsOption(
                    title: AppLocalizations.of(
                      context,
                    )!.notificationsType(type.name),
                    subtitle: AppLocalizations.of(
                      context,
                    )!.notificationsSubtitles(type.name),
                    trailing:
                        snapshot.data == type ? const Icon(Icons.check) : null,
                    onTap: () async {
                      final bool response = await NotificationsController
                          .instance
                          .setNotificationsType(type);

                      if (response || !context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(Icons.error),
                              Expanded(
                                child: Column(
                                  spacing: 4,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.notificationNotAuthorized,
                                    ),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.notificationNotAuthorizedSubtitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
      ),
      StreamBuilder<List<PlatformDto>>(
        stream: PlatformController.instance.streamController.stream,
        initialData: PlatformController.instance.items,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<PlatformDto>> snapshotPlatforms,
        ) {
          if (snapshotPlatforms.connectionState != ConnectionState.active) {
            return const SizedBox.shrink();
          }

          return StreamBuilder<List<PlatformDto>>(
            stream:
                NotificationsController
                    .instance
                    .platformStreamController
                    .stream,
            initialData: widget.member?.notificationSettings?.platforms ?? snapshotPlatforms.data,
            builder:
                (
                  final BuildContext context,
                  final AsyncSnapshot<List<PlatformDto>> snapshot,
                ) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (final PlatformDto platform in snapshotPlatforms.data!)
                      SettingsOption(
                        leading: PlatformComponent(platform: platform),
                        title: platform.name,
                        trailing: Switch(
                          value:
                              true ==
                              snapshot.data?.any(
                                (final PlatformDto mp) => mp.id == platform.id,
                              ),
                          onChanged: (final bool value) {
                            NotificationsController.instance.togglePlatform(
                              platform,
                            );
                          },
                        ),
                        onTap: () async {
                          await NotificationsController.instance.togglePlatform(
                            platform,
                          );
                        },
                      ),
                  ],
                ),
          );
        },
      ),
    ],
  );
}
