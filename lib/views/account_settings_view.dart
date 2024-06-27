import 'package:application/components/accounts/associate_email.dart';
import 'package:application/components/accounts/edit_identifier.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.settings),
      ),
      body: StreamBuilder<MemberDto>(
        stream: MemberController.instance.streamController.stream,
        initialData: MemberController.instance.member,
        builder: (context, snapshot) {
          final memberDto = snapshot.data;

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsCategory(
                  icon: Icons.person,
                  title: appLocalizations.account,
                  options: [
                    SettingsOption(
                      title: appLocalizations.identifier,
                      subtitle: appLocalizations.identifierSubtitle,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            MemberController.instance.identifier ??
                                appLocalizations.noIdentifier,
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              showAdaptiveDialog(
                                context: context,
                                builder: (context) => EditIdentifier(),
                              );
                            },
                            child: const Icon(Icons.edit),
                          ),
                        ],
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
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check, color: Colors.white),
                                const SizedBox(width: 8),
                                Text(appLocalizations.identifierCopied),
                              ],
                            ),
                          ),
                        );

                        Vibration.vibrate(duration: 200, amplitude: 255);
                      },
                    ),
                    SettingsOption(
                      title: appLocalizations.email,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            memberDto?.email ?? appLocalizations.noEmail,
                            style: const TextStyle(fontSize: 14),
                          ),
                          if (memberDto?.email == null) ...[
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AssociateEmail(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SettingsCategory(
                  icon: Icons.notifications,
                  title: appLocalizations.notifications,
                  options: [
                    StreamBuilder<NotificationsType>(
                      stream: NotificationsController
                          .instance.streamController.stream,
                      initialData:
                          NotificationsController.instance.notificationsType,
                      builder: (context, snapshot) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final type in NotificationsType.values)
                              SettingsOption(
                                title: appLocalizations
                                    .notificationsType(type.name),
                                subtitle: appLocalizations
                                    .notificationsSubtitles(type.name),
                                trailing: snapshot.data == type
                                    ? const Icon(Icons.check)
                                    : null,
                                onTap: () {
                                  NotificationsController.instance
                                      .setNotificationsType(type);
                                },
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SettingsCategory(
                  icon: Icons.sort,
                  title: appLocalizations.sort,
                  options: [
                    StreamBuilder<SortType>(
                      stream: SortController.instance.streamController.stream,
                      initialData: SortController.instance.sortType,
                      builder: (context, snapshot) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final type in SortType.values)
                              SettingsOption(
                                title: appLocalizations.sortType(type.name),
                                trailing: snapshot.data == type
                                    ? const Icon(Icons.check)
                                    : null,
                                onTap: () {
                                  SortController.instance.setSortType(type);
                                },
                              ),
                          ],
                        );
                      },
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
  final IconData icon;
  final String title;
  final List<Widget> options;

  const SettingsCategory({
    super.key,
    required this.icon,
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        ...options,
      ],
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsOption({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
