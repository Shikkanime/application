import 'package:application/controllers/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

class AssociateEmail extends StatefulWidget {
  const AssociateEmail({super.key});

  @override
  State<StatefulWidget> createState() => _AssociateEmailState();
}

class _AssociateEmailState extends State<AssociateEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isInvalidEmailError = false;
  bool _isConflictEmailError = false;
  bool _isCodeInError = false;
  bool _isLoading = false;
  String? _actionUuid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.associateEmail),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.emailContent,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 32),
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
              const SizedBox(height: 16),
              Row(
                children: [
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
                      onChanged: (value) {
                        // Make it uppercase
                        setState(() {
                          _codeController.text = value.toUpperCase();
                          _codeController.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: _codeController.text.length),
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _actionUuid != null || _isLoading
                        ? null
                        : () {
                            saveEmail();
                          },
                    child: Text(AppLocalizations.of(context)!.sendCode),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.emailSpamWarning,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _actionUuid == null || _isLoading
                    ? null
                    : () {
                        validateAction(context);
                      },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? errorText(BuildContext context) {
    if (_isInvalidEmailError) {
      return AppLocalizations.of(context)!.invalidEmail;
    }

    if (_isConflictEmailError) {
      return AppLocalizations.of(context)!.conflictEmail;
    }

    return null;
  }

  Future<void> saveEmail() async {
    if (_emailController.text.isEmpty) {
      vibrate();
      return;
    }

    if (!isValidEmail(_emailController.text)) {
      vibrate();
      updateState(invalidEmail: true);
      return;
    }

    if (_emailController.text == MemberController.instance.member?.email) {
      vibrate();
      updateState(conflictEmail: true);
      return;
    }

    updateState(invalidEmail: false, conflictEmail: false, isLoading: true);

    try {
      _actionUuid =
          await MemberController.instance.associateEmail(_emailController.text);

      setState(() {});
    } on ConflictEmailException {
      vibrate();
      updateState(conflictEmail: true, invalidEmail: false);
    } catch (e) {
      vibrate();
      updateState(conflictEmail: false, invalidEmail: true);
    } finally {
      updateState(isLoading: false);
    }
  }

  void vibrate() {
    Vibration.vibrate(duration: 200, amplitude: 255);
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[A-Za-z0-9+_.-]+@(.+)$').hasMatch(email);
  }

  void updateState({bool? invalidEmail, bool? conflictEmail, bool? isLoading}) {
    if (context.mounted) {
      setState(() {
        if (invalidEmail != null) _isInvalidEmailError = invalidEmail;
        if (conflictEmail != null) _isConflictEmailError = conflictEmail;
        if (isLoading != null) _isLoading = isLoading;
      });
    }
  }

  Future<void> validateAction(BuildContext context) async {
    if (_codeController.text.isEmpty || _actionUuid == null) {
      Vibration.vibrate(duration: 200, amplitude: 255);
      return;
    }

    setState(() {
      _isCodeInError = false;
    });

    try {
      await MemberController.instance
          .validateAction(_actionUuid!, _codeController.text);
      await MemberController.instance.login();

      if (context.mounted) {
        Navigator.of(context).pop();

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                AppLocalizations.of(context)!.yourEmailHasBeenAssociated,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.ok),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
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
