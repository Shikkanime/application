import 'package:application/controllers/sort_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/views/account_settings/settings_category.dart';
import 'package:application/views/account_settings/settings_option.dart';
import 'package:flutter/material.dart';

class SortCategory extends StatelessWidget {
  const SortCategory({super.key});

  @override
  Widget build(final BuildContext context) => SettingsCategory(
    icon: Icons.sort,
    title: AppLocalizations.of(context)!.sort,
    options: <Widget>[
      StreamBuilder<SortType>(
        stream: SortController.instance.streamController.stream,
        initialData: SortController.instance.sortType,
        builder:
            (
            final BuildContext context,
            final AsyncSnapshot<SortType> snapshot,
            ) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final SortType type in SortType.values)
              SettingsOption(
                title: AppLocalizations.of(context)!.sortType(type.name),
                trailing:
                snapshot.data == type
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  SortController.instance.setSortType(type);
                },
              ),
          ],
        ),
      ),
    ],
  );
}
