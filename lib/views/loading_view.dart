import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (Theme.of(context).iconImage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image(
                image: Theme.of(context).iconImage!,
                width: 100,
                height: 100,
              ),
            ),
          const CircularProgressIndicator(),
          Text(
            AppLocalizations.of(context)!.loggingIn,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ),
  );
}
