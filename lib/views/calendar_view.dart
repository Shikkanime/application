import 'package:application/components/animes/calendar_anime_component.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  String _currentDay = 'Lundi';

  List<Widget> _children(AsyncSnapshot<List<WeekDayDto>> snapshot) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: SegmentedButton<String>(
          multiSelectionEnabled: false,
          showSelectedIcon: false,
          onSelectionChanged: (values) {
            setState(() {
              _currentDay = values.first;
            });
          },
          segments: <ButtonSegment<String>>[
            for (final weekDay in snapshot.data!)
              ButtonSegment(
                value: weekDay.dayOfWeek,
                label: Text(
                  weekDay.dayOfWeek.substring(0, 3),
                  style: _currentDay == weekDay.dayOfWeek
                      ? Theme.of(context)
                          .segmentedButtonTheme
                          .style
                          ?.textStyle
                          ?.resolve({MaterialState.selected})?.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                      : null,
                ),
              ),
          ],
          selected: {_currentDay},
        ),
      ),
      for (final weekDay in snapshot.data!)
        if (weekDay.dayOfWeek == _currentDay)
          if (weekDay.releases.isNotEmpty)
            for (final release in weekDay.releases)
              CalendarAnimeComponent(release: release)
          else
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
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
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _currentDay = DateFormat('EEEE', 'fr_FR').format(DateTime.now());
    _currentDay = _currentDay[0].toUpperCase() + _currentDay.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WeekDayDto>>(
      stream: AnimeWeeklyController.instance.streamController.stream,
      initialData: AnimeWeeklyController.instance.weekDays,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Container();
        }

        final children = _children(snapshot);

        return RefreshIndicator.adaptive(
          onRefresh: () async {
            await AnimeWeeklyController.instance.init();
          },
          child: ListView.builder(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            shrinkWrap: true,
            controller: AnimeWeeklyController.instance.scrollController,
            itemCount: children.length,
            itemBuilder: (context, index) => children[index],
          ),
        );
      },
    );
  }
}
