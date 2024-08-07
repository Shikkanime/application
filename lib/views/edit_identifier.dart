import 'package:application/controllers/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

class EditIdentifier extends StatefulWidget {
  const EditIdentifier({super.key});

  @override
  State<StatefulWidget> createState() => _EditIdentifierState();
}

class _EditIdentifierState extends State<EditIdentifier> {
  final TextEditingController _controller = TextEditingController();
  bool _isInvalidIdentiferError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.enterNewIdentifier),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
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
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => saveIdentifier(context),
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveIdentifier(BuildContext context) async {
    if (_controller.text.isEmpty) {
      Vibration.vibrate(duration: 200, amplitude: 255);
      return;
    }

    final oldIdentifier = MemberController.instance.identifier;

    try {
      await MemberController.instance.testLogin(_controller.text);
      await MemberController.instance.login(identifier: _controller.text);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      Vibration.vibrate(duration: 200, amplitude: 255);

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
