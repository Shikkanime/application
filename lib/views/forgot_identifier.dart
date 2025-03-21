import 'package:application/components/elevated_async_button.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgotIdentifier extends StatefulWidget {
  const ForgotIdentifier({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotIdentifierState();
}

class _ForgotIdentifierState extends State<ForgotIdentifier> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isInvalidEmailError = false;
  bool _isConflictEmailError = false;
  bool _isCodeInError = false;
  String? _actionUuid;

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: false,
      title: Text(AppLocalizations.of(context)!.forgotIdentifier),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          spacing: 32,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.emailNotAssociated,
              textAlign: TextAlign.left,
            ),
            TextField(
              enabled: _actionUuid == null,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)!.email,
                errorText: errorText(context),
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            Row(
              spacing: 16,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    enabled: _actionUuid != null,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.code,
                      errorText:
                          _isCodeInError
                              ? AppLocalizations.of(context)!.invalidCode
                              : null,
                    ),
                    controller: _codeController,
                    onChanged: (final String value) {
                      // Make it uppercase
                      setState(() {
                        _codeController
                          ..text = value.toUpperCase()
                          ..selection = TextSelection.fromPosition(
                            TextPosition(offset: _codeController.text.length),
                          );
                      });
                    },
                  ),
                ),
                ElevatedAsyncButton(
                  onPressed: _actionUuid != null ? null : askCode,
                  child: Text(AppLocalizations.of(context)!.sendCode),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context)!.emailSpamWarning,
              textAlign: TextAlign.left,
            ),
            ElevatedAsyncButton(
              onPressed:
                  _actionUuid == null
                      ? null
                      : () async => validateAction(context),
              child: Text(AppLocalizations.of(context)!.save),
            ),
          ],
        ),
      ),
    ),
  );

  String? errorText(final BuildContext context) {
    if (_isInvalidEmailError) {
      return AppLocalizations.of(context)!.invalidEmail;
    }

    if (_isConflictEmailError) {
      return AppLocalizations.of(
        context,
      )!.emailAlreadyAssociatedWithYourAccount;
    }

    return null;
  }

  Future<void> askCode() async {
    if (_emailController.text.isEmpty) {
      vibrate();
      return;
    }

    if (!isValidEmail(_emailController.text)) {
      vibrate();
      updateState(invalidEmail: true);
      return;
    }

    if (MemberController.instance.member!.email!.isNotEmpty &&
        _emailController.text == MemberController.instance.member?.email) {
      vibrate();
      updateState(conflictEmail: true);
      return;
    }

    updateState(invalidEmail: false, conflictEmail: false);

    try {
      _actionUuid = await MemberController.instance.forgotIdentifier(
        _emailController.text,
      );

      setState(() {});
    } on ConflictEmailException {
      vibrate();
      updateState(conflictEmail: true, invalidEmail: false);
    } on Exception {
      vibrate();
      updateState(conflictEmail: false, invalidEmail: true);
    }
  }

  void vibrate() {
    VibrationController.instance.vibrate(duration: 200, amplitude: 255);
  }

  bool isValidEmail(final String email) =>
      RegExp(r'^[A-Za-z0-9+_.-]+@(.+)$').hasMatch(email);

  void updateState({final bool? invalidEmail, final bool? conflictEmail}) {
    if (context.mounted) {
      setState(() {
        if (invalidEmail != null) {
          _isInvalidEmailError = invalidEmail;
        }

        if (conflictEmail != null) {
          _isConflictEmailError = conflictEmail;
        }
      });
    }
  }

  Future<void> validateAction(final BuildContext context) async {
    if (_codeController.text.isEmpty || _actionUuid == null) {
      VibrationController.instance.vibrate(duration: 200, amplitude: 255);
      return;
    }

    setState(() {
      _isCodeInError = false;
    });

    try {
      await MemberController.instance.validateAction(
        _actionUuid!,
        _codeController.text,
      );

      if (context.mounted) {
        Navigator.of(context).pop();

        await showDialog(
          context: context,
          builder:
              (final BuildContext context) => AlertDialog(
                content: Text(
                  AppLocalizations.of(context)!.yourNewIdentifierHasBeenSent,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppLocalizations.of(context)!.ok),
                  ),
                ],
              ),
        );
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      vibrate();

      if (context.mounted) {
        setState(() {
          _isCodeInError = true;
        });
      }
    }
  }
}
