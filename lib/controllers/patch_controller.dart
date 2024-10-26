import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

enum _PatchDownloadStatus {
  downloading,
  downloaded,
  failed,
}

class PatchController {
  static final instance = PatchController();
  final _shorebirdCodePush = ShorebirdCodePush();
  final streamController = StreamController<_PatchDownloadStatus>.broadcast();

  bool get _isShorebirdAvailable => _shorebirdCodePush.isShorebirdAvailable();

  Future<void> patch(BuildContext context) async {
    if (!_isShorebirdAvailable) return;
    final isPatchAvailable =
        await _shorebirdCodePush.isNewPatchAvailableForDownload();
    if (!context.mounted || !isPatchAvailable) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(days: 1),
        behavior: SnackBarBehavior.floating,
        content: StreamBuilder<_PatchDownloadStatus>(
          stream: streamController.stream,
          initialData: _PatchDownloadStatus.downloading,
          builder: (context, snapshot) {
            final status = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (status == _PatchDownloadStatus.downloading) ...[
                  const CircularProgressIndicator(),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.downloadingPatch),
                  ),
                ],
                if (status == _PatchDownloadStatus.downloaded) ...[
                  const Icon(Icons.check),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.patchDownloaded),
                  ),
                ],
                if (status == _PatchDownloadStatus.failed) ...[
                  const Icon(Icons.error),
                  const SizedBox(width: 8),
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

    await _shorebirdCodePush.downloadUpdateIfAvailable();
    await Future.delayed(const Duration(seconds: 1));
    streamController.add(_PatchDownloadStatus.downloaded);
    await Future.delayed(const Duration(seconds: 5));
    if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
