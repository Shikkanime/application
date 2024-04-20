import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_128x128.png',
              width: 128,
              height: 128,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.noInternet,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Restart.restartApp();
              },
              child: Text(AppLocalizations.of(context)!.tryAgain),
            ),
          ],
        ),
      ),
    );
  }
}
