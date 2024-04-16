import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:restart_app/restart_app.dart';

class UpdateAvailableComponent extends StatefulWidget {
  const UpdateAvailableComponent({super.key});

  @override
  State<UpdateAvailableComponent> createState() =>
      _UpdateAvailableComponentState();
}

enum _UpdateStatus {
  idle,
  downloading,
  downloaded,
}

class _UpdateAvailableComponentState extends State<UpdateAvailableComponent> {
  _UpdateStatus _updateStatus = _UpdateStatus.idle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_updateStatus == _UpdateStatus.downloading) ...[
              const CircularProgressIndicator.adaptive(),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.downloadingUpdate,
                style: textTheme.bodySmall,
              ),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.updateAvailable,
                style: textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.updateAvailableDesc,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _downloadUpdate();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.downloadUpdate),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _downloadUpdate() async {
    setState(() {
      _updateStatus = _UpdateStatus.downloading;
    });

    await Future.wait([
      shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 1000)),
    ]);

    setState(() {
      _updateStatus = _UpdateStatus.downloaded;
    });

    Restart.restartApp();
  }
}
