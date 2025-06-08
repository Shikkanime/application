import 'package:application/components/elevated_async_button.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ActionValidationView extends StatefulWidget {
  const ActionValidationView({
    required this.title,
    required this.contentText,
    required this.requestAction,
    required this.validateAction,
    required this.successMessage,
    this.isEmailInvalid,
    this.postValidation,
    this.conflictEmailMessage,
    super.key,
  });

  final String title;
  final String contentText;
  final Future<String?> Function(String email) requestAction;
  final Future<void> Function(String actionUuid, String code) validateAction;
  final String successMessage;
  final bool Function(String email)? isEmailInvalid;
  final Future<void> Function()? postValidation;
  final String? conflictEmailMessage;

  @override
  State<StatefulWidget> createState() => _ActionValidationViewState();
}

class _ActionValidationViewState extends State<ActionValidationView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isInvalidEmailError = false;
  bool _isConflictEmailError = false;
  bool _isCodeInError = false;
  String? _actionUuid;

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(centerTitle: false, title: Text(widget.title)),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          spacing: 32,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.contentText, textAlign: TextAlign.left),
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
                      errorText: _isCodeInError
                          ? AppLocalizations.of(context)!.invalidCode
                          : null,
                    ),
                    controller: _codeController,
                    onChanged: (final String value) {
                      // Make it uppercase, keep only letters and numbers
                      setState(() {
                        _codeController
                          ..text = value
                              .replaceAll(RegExp('[^A-Za-z0-9]'), '')
                              .toUpperCase()
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
              onPressed: _actionUuid == null
                  ? null
                  : () async => validateActionInternal(context),
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
      return widget.conflictEmailMessage ??
          AppLocalizations.of(context)!.conflictEmail;
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

    if (widget.isEmailInvalid != null &&
        widget.isEmailInvalid!(_emailController.text)) {
      vibrate();
      updateState(conflictEmail: true);
      return;
    }

    updateState(invalidEmail: false, conflictEmail: false);

    try {
      _actionUuid = await widget.requestAction(_emailController.text);
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

  Future<void> validateActionInternal(final BuildContext context) async {
    if (_codeController.text.isEmpty || _actionUuid == null) {
      VibrationController.instance.vibrate(duration: 200, amplitude: 255);
      return;
    }

    setState(() {
      _isCodeInError = false;
    });

    try {
      await widget.validateAction(_actionUuid!, _codeController.text);

      if (widget.postValidation != null) {
        await widget.postValidation!();
      }

      if (context.mounted) {
        Navigator.of(context).pop();

        await showDialog(
          context: context,
          builder: (final BuildContext context) => AlertDialog(
            content: Text(widget.successMessage),
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

class ConflictEmailException implements Exception {}
