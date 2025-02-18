import 'package:application/components/elevated_async_button.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/vibration_controller.dart';
import 'package:application/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class EditIdentifier extends StatefulWidget {
  const EditIdentifier({super.key});

  @override
  State<StatefulWidget> createState() => _EditIdentifierState();
}

class _EditIdentifierState extends State<EditIdentifier> {
  final TextEditingController _controller = TextEditingController();
  bool _isInvalidIdentiferError = false;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(AppLocalizations.of(context)!.enterNewIdentifier),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              spacing: 32,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.identifier,
                    errorText: _isInvalidIdentiferError
                        ? AppLocalizations.of(context)!.invalidIdentifier
                        : null,
                  ),
                  controller: _controller,
                ),
                ElevatedAsyncButton(
                  onPressed: () async => saveIdentifier(context),
                  child: Text(AppLocalizations.of(context)!.save),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> saveIdentifier(final BuildContext context) async {
    if (_controller.text.isEmpty) {
      VibrationController.instance.vibrate(duration: 200, amplitude: 255);
      return;
    }

    final String? oldIdentifier = MemberController.instance.identifier;

    try {
      await MemberController.instance.testLogin(_controller.text);
      await MemberController.instance.login(identifier: _controller.text);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } on Exception catch (_) {
      VibrationController.instance.vibrate(duration: 200, amplitude: 255);

      if (MemberController.instance.identifier != oldIdentifier) {
        await MemberController.instance.login(identifier: oldIdentifier);
      }

      if (context.mounted) {
        setState(() {
          _isInvalidIdentiferError = true;
        });
      }
    }
  }
}
