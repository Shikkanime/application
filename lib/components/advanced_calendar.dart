import 'package:application/components/elevated_async_button.dart';
import 'package:application/components/lang_type_component.dart';
import 'package:application/controllers/animes/anime_search_controller.dart';
import 'package:application/controllers/animes/anime_weekly_controller.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/extensions.dart';
import 'package:flutter/material.dart';

class AdvancedCalendar extends StatelessWidget {
  const AdvancedCalendar({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(final BuildContext context) {
    final AnimeWeeklyController controller = AnimeWeeklyController.instance;
    final ThemeData theme = Theme.of(context);

    ButtonStyle? getActiveButtonStyle(final bool isActive) =>
        isActive
            ? theme.elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(
                theme.colorScheme.primary,
              ),
            )
            : null;

    Color? getTextColor(final bool isActive) =>
        isActive ? theme.oppositeTextColor : theme.textTheme.bodyLarge?.color;

    return Scrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 8,
          children: <Widget>[
            ElevatedAsyncButton(
              style: getActiveButtonStyle(controller.isWatchlist),
              onPressed: () async {
                controller.isWatchlist = !controller.isWatchlist;
                await controller.init();
              },
              child: Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    controller.isWatchlist
                        ? Icons.filter_alt
                        : Icons.filter_alt_off,
                    color: getTextColor(controller.isWatchlist),
                  ),
                  Text(
                    AppLocalizations.of(context)!.watchlist,
                    style: TextStyle(
                      color: getTextColor(controller.isWatchlist),
                    ),
                  ),
                ],
              ),
            ),

            for (final SearchType type in SearchType.values)
              ElevatedAsyncButton(
                style: getActiveButtonStyle(controller.searchType == type),
                onPressed: () async {
                  controller.searchType =
                      controller.searchType == type ? null : type;
                  await controller.init();
                },
                child: LangTypeComponent(
                  langType: type.name.toUpperCase(),
                  color: getTextColor(controller.searchType == type),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
