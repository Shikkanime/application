import 'package:application/components/accounts/associate_email.dart';
import 'package:application/components/accounts/edit_identifier.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/notifications_controller.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        appLocalizations.account,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(appLocalizations.identifier),
                  subtitle: Text(appLocalizations.identifierSubtitle),
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
                ListTile(
                  title: Text(appLocalizations.email),
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
                                builder: (context) => const AssociateEmail(),
                              ),
                            );
                          },
                          child: const Icon(Icons.edit),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Icon(
                        Icons.notifications,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        appLocalizations.notifications,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<NotificationsType>(
                  stream:
                      NotificationsController.instance.streamController.stream,
                  initialData:
                      NotificationsController.instance.notificationsType,
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final type in NotificationsType.values)
                          ListTile(
                            title: Text(
                              appLocalizations.notificationsType(type.name),
                            ),
                            subtitle: Text(
                              appLocalizations
                                  .notificationsSubtitles(type.name),
                            ),
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
