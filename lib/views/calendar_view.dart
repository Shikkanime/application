import 'package:application/components/anime_component.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  String _currentDay = 'Lundi';

  List<Widget> _buildAnimeList(List<WeekDayReleaseDto> list) {
    final widgets = <Widget>[];

    for (int i = 0; i < list.length; i += 2) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimeComponent(
                anime: list[i].anime,
                hour: _releaseHour(list[i].releaseDateTime),
                platforms: list[i].platforms,
              ),
            ),
            if (i + 1 < list.length)
              Expanded(
                child: AnimeComponent(
                  anime: list[i + 1].anime,
                  hour: _releaseHour(list[i + 1].releaseDateTime),
                  platforms: list[i + 1].platforms,
                ),
              )
            else
              const Spacer(),
          ],
        ),
      );
    }

    return widgets;
  }

  String _releaseHour(String releaseDateTime) {
    final parsed = DateTime.parse(releaseDateTime).toLocal();
    return '${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  }

  List<Widget> _children(AsyncSnapshot<List<WeekDayDto>> snapshot) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
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
                label: Text(weekDay.dayOfWeek.substring(0, 2)),
              ),
          ],
          selected: {_currentDay},
        ),
      ),
      for (final weekDay in snapshot.data!)
        if (weekDay.dayOfWeek == _currentDay)
          ..._buildAnimeList(weekDay.releases),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WeekDayDto>>(
      stream: AnimeWeeklyController.instance.streamController.stream,
      initialData: AnimeWeeklyController.instance.weekDays,
      builder: (context, snapshot) {
        final children = _children(snapshot);

        return ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          shrinkWrap: true,
          controller: AnimeWeeklyController.instance.scrollController,
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}
