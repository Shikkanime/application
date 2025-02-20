import 'dart:math';

import 'package:application/components/animes/calendar_anime_component.dart';
import 'package:application/controllers/animes/anime_weekly_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  int _currentDay = 0;

  List<Widget> _buildList(final List<WeekDayDto> releases) {
    final double smallestDimension = MediaQuery.sizeOf(context).width;

    final WeekDayDto currentWeekDay = releases.firstWhere(
      (final WeekDayDto weekDay) => _currentDay == releases.indexOf(weekDay),
      orElse: () => WeekDayDto(
        dayOfWeek:
            AppLocalizations.of(context)!.weekDays(_currentDay.toString()),
        releases: <WeekDayReleaseDto>[],
      ),
    );

    final Padding daysButton = Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _currentDay = (_currentDay - 1) % 7;
              });
            },
            icon: const Icon(Icons.keyboard_arrow_left),
          ),
          Text(
            AppLocalizations.of(context)!
                .weekDays(releases.indexOf(currentWeekDay).toString()),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _currentDay = (_currentDay + 1) % 7;
              });
            },
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );

    if (currentWeekDay.releases.isEmpty) {
      return <Widget>[
        daysButton,
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              const Icon(
                Icons.sentiment_very_dissatisfied,
                size: 48,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.oops,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.noAnimeToday,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ];
    }

    return <Widget>[
      daysButton,
      ...wb.WidgetBuilder.instance.buildRowWidgets(
        currentWeekDay.releases.map(
          (final WeekDayReleaseDto release) => CalendarAnimeComponent(
            key: Key(release.anime.uuid),
            release: release,
          ),
        ),
        maxElementsPerRow: max(1, (smallestDimension * 3 / 900).floor()),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _currentDay = DateTime.now().weekday - 1;
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<List<WeekDayDto>>(
        stream: AnimeWeeklyController.instance.streamController.stream,
        initialData: AnimeWeeklyController.instance.items,
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<WeekDayDto>> snapshot,
        ) {
          final List<Widget> list = _buildList(snapshot.data!);

          return RefreshIndicator.adaptive(
            onRefresh: () async {
              await AnimeWeeklyController.instance.init();
            },
            child: ListView.builder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              controller: AnimeWeeklyController.instance.scrollController,
              itemCount: list.length,
              itemBuilder: (final BuildContext context, final int index) =>
                  list[index],
            ),
          );
        },
      );
}
