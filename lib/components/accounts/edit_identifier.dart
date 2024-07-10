import 'package:application/controllers/member_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vibration/vibration.dart';

class EditIdentifier extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  EditIdentifier({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.enterNewIdentifier,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.identifier,
            ),
            controller: _controller,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            saveIdentifier(context);
          },
          child: Text(AppLocalizations.of(context)!.save),
        ),
      ],
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
    } catch (e) {
      Vibration.vibrate(duration: 200, amplitude: 255);

      if (MemberController.instance.identifier != oldIdentifier) {
        await MemberController.instance.login(identifier: oldIdentifier);
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.close),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.invalidIdentifier,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }
    } finally {
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
