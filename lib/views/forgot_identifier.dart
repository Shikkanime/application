import 'package:application/components/action_validation_view.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgotIdentifier extends StatelessWidget {
  const ForgotIdentifier({super.key});

  @override
  Widget build(final BuildContext context) => ActionValidationView(
    title: AppLocalizations.of(context)!.forgotIdentifier,
    contentText: AppLocalizations.of(context)!.emailNotAssociated,
    successMessage: AppLocalizations.of(context)!.yourNewIdentifierHasBeenSent,
    requestAction: MemberController.instance.forgotIdentifier,
    validateAction: MemberController.instance.validateAction,
    isEmailInvalid:
        (final String email) =>
            MemberController.instance.member!.email!.isNotEmpty &&
            email == MemberController.instance.member?.email,
    conflictEmailMessage:
        AppLocalizations.of(context)!.emailAlreadyAssociatedWithYourAccount,
  );
}
