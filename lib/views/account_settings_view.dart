import 'package:application/components/card_component.dart';
import 'package:application/views/associate_email.dart';
import 'package:application/views/edit_identifier.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/views/forgot_identifier.dart';
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
        centerTitle: false,
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
                      subtitle: MemberController.instance.identifier ??
                          appLocalizations.noIdentifier,
                      tooltip: appLocalizations.identifierSubtitle,
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditIdentifier(),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.copy),
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
                      subtitle: memberDto?.email ?? appLocalizations.noEmail,
                      trailing: memberDto?.email == null
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
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
                          MaterialPageRoute(
                            builder: (context) => const ForgotIdentifier(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                                tooltip: appLocalizations
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
                const SizedBox(height: 16),
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
            ],
          ),
        ),
        const SizedBox(height: 8),
        CustomCard(
          child: Column(
            children: options,
          ),
        ),
      ],
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? tooltip;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsOption({
    super.key,
    required this.title,
    this.subtitle,
    this.tooltip,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Flex(direction: Axis.horizontal, children: [
        Text(title),
        if (tooltip != null) ...[
          const SizedBox(width: 8),
          Tooltip(
            message: tooltip!,
            child: const Icon(Icons.info_outline, size: 20, color: Colors.grey),
          ),
        ],
      ]),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
