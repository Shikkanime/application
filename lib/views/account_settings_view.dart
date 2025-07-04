import 'package:application/components/card_component.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/views/associate_email.dart';
import 'package:application/views/edit_identifier.dart';
import 'package:application/views/forgot_identifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(final BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(appLocalizations.settings),
      ),
      body: StreamBuilder<MemberDto>(
        stream: MemberController.instance.streamController.stream,
        initialData: MemberController.instance.member,
        builder: (final BuildContext context, final AsyncSnapshot<MemberDto> snapshot) {
          final MemberDto? memberDto = snapshot.data;

          return SingleChildScrollView(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SettingsCategory(
                  icon: Icons.person,
                  title: appLocalizations.account,
                  options: <Widget>[
                    SettingsOption(
                      title: appLocalizations.identifier,
                      subtitle:
                          MemberController.instance.identifier ??
                          appLocalizations.noIdentifier,
                      tooltip: appLocalizations.identifierSubtitle,
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (final BuildContext context) =>
                                  const EditIdentifier(),
                            ),
                          );
                        },
                        child: const Icon(Icons.edit),
                      ),
                      onTap: () {
                        if (MemberController.instance.identifier == null) {
                          return;
                        }

                        // Copy to clipboard
                        Clipboard.setData(
                          ClipboardData(
                            text: MemberController.instance.identifier!,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(Icons.copy),
                                Text(appLocalizations.identifierCopied),
                              ],
                            ),
                          ),
                        );

                        VibrationController.instance.vibrate(
                          duration: 200,
                          amplitude: 255,
                        );
                      },
                    ),
                    SettingsOption(
                      title: appLocalizations.email,
                      subtitle: memberDto?.email ?? appLocalizations.noEmail,
                      trailing: memberDto?.email == null
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (final BuildContext context) =>
                                        const AssociateEmail(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit),
                            )
                          : null,
                    ),
                    SettingsOption(
                      title: appLocalizations.forgotIdentifier,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (final BuildContext context) =>
                                const ForgotIdentifier(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SettingsCategory(
                  icon: Icons.notifications,
                  title: appLocalizations.notifications,
                  options: <Widget>[
                    StreamBuilder<NotificationsType>(
                      stream: NotificationsController
                          .instance
                          .streamController
                          .stream,
                      initialData:
                          NotificationsController.instance.notificationsType,
                      builder:
                          (
                            final BuildContext context,
                            final AsyncSnapshot<NotificationsType> snapshot,
                          ) => Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: NotificationsType.values
                                .map(
                                  (
                                    final NotificationsType type,
                                  ) => SettingsOption(
                                    title: appLocalizations.notificationsType(
                                      type.name,
                                    ),
                                    subtitle: appLocalizations
                                        .notificationsSubtitles(type.name),
                                    trailing: snapshot.data == type
                                        ? const Icon(Icons.check)
                                        : null,
                                    onTap: () async {
                                      final bool response =
                                          await NotificationsController.instance
                                              .setNotificationsType(type);

                                      if (response || !context.mounted) {
                                        return;
                                      }

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          content: Row(
                                            spacing: 8,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              const Icon(Icons.error),
                                              Expanded(
                                                child: Column(
                                                  spacing: 4,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                )
                                .toList(),
                          ),
                    ),
                  ],
                ),
                SettingsCategory(
                  icon: Icons.sort,
                  title: appLocalizations.sort,
                  options: <Widget>[
                    StreamBuilder<SortType>(
                      stream: SortController.instance.streamController.stream,
                      initialData: SortController.instance.sortType,
                      builder:
                          (
                            final BuildContext context,
                            final AsyncSnapshot<SortType> snapshot,
                          ) => Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: SortType.values
                                .map(
                                  (final SortType type) => SettingsOption(
                                    title: appLocalizations.sortType(type.name),
                                    trailing: snapshot.data == type
                                        ? const Icon(Icons.check)
                                        : null,
                                    onTap: () {
                                      SortController.instance.setSortType(type);
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SettingsCategory extends StatelessWidget {
  const SettingsCategory({
    required this.icon,
    required this.title,
    required this.options,
    super.key,
  });

  final IconData icon;
  final String title;
  final List<Widget> options;

  @override
  Widget build(final BuildContext context) => Column(
    spacing: 8,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Flex(
          spacing: 8,
          direction: Axis.horizontal,
          children: <Widget>[
            Icon(icon, color: Colors.grey),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      CustomCard(child: Column(children: options)),
    ],
  );
}

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    required this.title,
    super.key,
    this.subtitle,
    this.tooltip,
    this.trailing,
    this.onTap,
  });
  final String title;
  final String? subtitle;
  final String? tooltip;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) => ListTile(
    title: Flex(
      spacing: 8,
      direction: Axis.horizontal,
      children: <Widget>[
        Text(title),
        if (tooltip != null)
          Tooltip(
            message: tooltip,
            child: const Icon(Icons.info_outline, size: 20, color: Colors.grey),
          ),
      ],
    ),
    subtitle: subtitle?.isNotEmpty ?? false ? Text(subtitle!) : null,
    trailing: trailing,
    onTap: onTap,
  );
}
