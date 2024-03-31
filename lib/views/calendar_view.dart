import 'package:application/components/anime_component.dart';
import 'package:application/controllers/anime_weekly_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/week_day_dto.dart';
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

  List<Widget> _buildAnimeList(List<AnimeDto> animes) {
    final widgets = <Widget>[];

    for (int i = 0; i < animes.length; i += 2) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: AnimeComponent(anime: animes[i])),
            if (i + 1 < animes.length)
              Expanded(child: AnimeComponent(anime: animes[i + 1]))
            else
              const Spacer(),
          ],
        ),
      );
    }

    return widgets;
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
                label: Text(weekDay.dayOfWeek.substring(0, 3)),
              ),
          ],
          selected: {_currentDay},
        ),
      ),
      for (final weekDay in snapshot.data!)
        if (weekDay.dayOfWeek == _currentDay)
          ..._buildAnimeList(
            weekDay.releases.map((e) => e.anime).toList(),
          ),
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
