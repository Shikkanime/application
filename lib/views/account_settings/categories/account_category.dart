import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/dtos/member_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/views/account_settings/settings_category.dart';
import 'package:application/views/account_settings/settings_option.dart';
import 'package:application/views/associate_email.dart';
import 'package:application/views/edit_identifier.dart';
import 'package:application/views/forgot_identifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountCategory extends StatelessWidget {
  const AccountCategory({super.key, this.member});

  final MemberDto? member;

  @override
  Widget build(final BuildContext context) => SettingsCategory(
    icon: Icons.person,
    title: AppLocalizations.of(context)!.account,
    options: <Widget>[
      SettingsOption(
        title: AppLocalizations.of(context)!.identifier,
        subtitle:
            MemberController.instance.identifier ??
            AppLocalizations.of(context)!.noIdentifier,
        tooltip: AppLocalizations.of(context)!.identifierSubtitle,
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => const EditIdentifier(),
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
            ClipboardData(text: MemberController.instance.identifier!),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.copy),
                  Text(AppLocalizations.of(context)!.identifierCopied),
                ],
              ),
            ),
          );

          VibrationController.instance.vibrate(duration: 200, amplitude: 255);
        },
      ),
      SettingsOption(
        title: AppLocalizations.of(context)!.email,
        subtitle: member?.email ?? AppLocalizations.of(context)!.noEmail,
        trailing:
            member?.email == null
                ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder:
                            (final BuildContext context) =>
                                const AssociateEmail(),
                      ),
                    );
                  },
                  child: const Icon(Icons.edit),
                )
                : null,
      ),
      SettingsOption(
        title: AppLocalizations.of(context)!.forgotIdentifier,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (final BuildContext context) => const ForgotIdentifier(),
            ),
          );
        },
      ),
    ],
  );
}
