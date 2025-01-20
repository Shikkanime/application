import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:restart_app/restart_app.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: Theme.of(context).getIconImage()!,
                width: 128,
                height: 128,
              ),
              Text(
                AppLocalizations.of(context)!.noInternet,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ElevatedButton(
                onPressed: Restart.restartApp,
                child: Text(AppLocalizations.of(context)!.tryAgain),
              ),
            ],
          ),
        ),
      );
}
