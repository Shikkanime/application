import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class UpdateController {
  static final UpdateController instance = UpdateController();

  void _showSnackBar(final BuildContext context, final String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> checkIfStoreUpdateIsAvailable(final BuildContext context) async {
    final AppUpdateInfo updateInfo;

    try {
      updateInfo = await InAppUpdate.checkForUpdate();
    } on Exception catch (e) {
      debugPrint('Error checking for update: $e');
      return;
    }

    if (updateInfo.updateAvailability != UpdateAvailability.updateAvailable) {
      debugPrint('No update available.');
      return;
    }

    // Request the update
    final AppUpdateResult result = await InAppUpdate.startFlexibleUpdate();

    if (result == AppUpdateResult.userDeniedUpdate) {
      return;
    } else if (result == AppUpdateResult.inAppUpdateFailed) {
      debugPrint('In-app update failed.');

      if (!context.mounted) {
        return;
      }

      _showSnackBar(context, 'In-app update failed.');
      return;
    }

    await InAppUpdate.completeFlexibleUpdate();
    debugPrint('In-app update completed.');

    if (!context.mounted) {
      return;
    }

    _showSnackBar(context, 'In-app update completed.');
  }
}
