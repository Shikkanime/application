import 'dart:async';

import 'package:application/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

enum PatchDownloadStatus { downloading, downloaded, failed }

class PatchController {
  static final PatchController instance = PatchController();
  final ShorebirdUpdater _shorebirdUpdater = ShorebirdUpdater();
  final StreamController<PatchDownloadStatus> streamController =
      StreamController<PatchDownloadStatus>.broadcast();

  Future<void> patch(final BuildContext context) async {
    if (!_shorebirdUpdater.isAvailable) {
      return;
    }

    final UpdateStatus status = await _shorebirdUpdater.checkForUpdate();

    if (!context.mounted || status != UpdateStatus.outdated) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(days: 1),
        behavior: SnackBarBehavior.floating,
        content: StreamBuilder<PatchDownloadStatus>(
          stream: streamController.stream,
          initialData: PatchDownloadStatus.downloading,
          builder: (
            final BuildContext context,
            final AsyncSnapshot<PatchDownloadStatus> snapshot,
          ) {
            final PatchDownloadStatus? status = snapshot.data;
            return Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (status == PatchDownloadStatus.downloading) ...<Widget>[
                  const CircularProgressIndicator(),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.downloadingPatch),
                  ),
                ],
                if (status == PatchDownloadStatus.downloaded) ...<Widget>[
                  const Icon(Icons.check),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.patchDownloaded),
                  ),
                ],
                if (status == PatchDownloadStatus.failed) ...<Widget>[
                  const Icon(Icons.error),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.patchFailed),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );

    try {
      await _shorebirdUpdater.update();
      await Future<void>.delayed(const Duration(seconds: 1));
      streamController.add(PatchDownloadStatus.downloaded);
    } on UpdateException {
      await Future<void>.delayed(const Duration(seconds: 1));
      streamController.add(PatchDownloadStatus.failed);
    }

    await Future<void>.delayed(const Duration(seconds: 5));

    if (context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }
}
