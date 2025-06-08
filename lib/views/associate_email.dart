import 'package:application/components/action_validation_view.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AssociateEmail extends StatelessWidget {
  const AssociateEmail({super.key});

  @override
  Widget build(final BuildContext context) => ActionValidationView(
    title: AppLocalizations.of(context)!.associateEmail,
    contentText: AppLocalizations.of(context)!.emailContent,
    successMessage: AppLocalizations.of(context)!.yourEmailHasBeenAssociated,
    requestAction: MemberController.instance.associateEmail,
    validateAction: MemberController.instance.validateAction,
    isEmailInvalid: (final String email) =>
        email == MemberController.instance.member?.email,
    postValidation: MemberController.instance.login,
  );
}
