import 'package:application/components/advanced_calendar.dart';
import 'package:application/components/animes/calendar/calendar_anime_component.dart';
import 'package:application/components/animes/calendar/calendar_anime_loader_component.dart';
import 'package:application/controllers/animes/anime_weekly_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/dtos/week_day_release_dto.dart';
import 'package:application/l10n/app_localizations.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  final ScrollController _scrollController = ScrollController();

  List<Widget> _buildList(
    final BuildContext context,
    final List<WeekDayDto> releases,
  ) {
    final int currentDay = AnimeWeeklyController.instance.selectedDay;

    if (releases.isEmpty) {
      return _buildEmptyReleasesList(context);
    }

    final WeekDayDto currentWeekDay = _getCurrentWeekDay(
      context,
      releases,
      currentDay,
    );
    final Padding daysNavigationBar = _buildDaysNavigationBar(
      context,
      releases,
      currentWeekDay,
    );

    if (currentWeekDay.releases.isEmpty) {
      return _buildEmptyDayReleasesList(context, daysNavigationBar);
    }

    return _buildFullList(context, currentWeekDay, daysNavigationBar);
  }

  Widget _buildCalendar() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: AdvancedCalendar(scrollController: _scrollController),
  );

  List<Widget> _buildEmptyReleasesList(final BuildContext context) => <Widget>[
    _buildCalendar(),
    ...wb.WidgetBuilder.instance.buildRowWidgets(
      List<CalendarAnimeLoaderComponent>.generate(
        12,
        (final int index) => const CalendarAnimeLoaderComponent(),
      ),
      maxElementsPerRow: AnimeWeeklyController.instance.maxElementsPerRow(
        context,
      ),
    ),
  ];

  WeekDayDto _getCurrentWeekDay(
    final BuildContext context,
    final List<WeekDayDto> releases,
    final int currentDay,
  ) => releases.firstWhere(
    (final WeekDayDto weekDay) => currentDay == releases.indexOf(weekDay),
    orElse:
        () => WeekDayDto(
          dayOfWeek: AppLocalizations.of(
            context,
          )!.weekDays(currentDay.toString()),
          releases: <WeekDayReleaseDto>[],
        ),
  );

  Padding _buildDaysNavigationBar(
    final BuildContext context,
    final List<WeekDayDto> releases,
    final WeekDayDto currentWeekDay,
  ) => Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: AnimeWeeklyController.instance.previousDay,
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        Text(
          AppLocalizations.of(
            context,
          )!.weekDays(releases.indexOf(currentWeekDay).toString()),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: AnimeWeeklyController.instance.nextDay,
          icon: const Icon(Icons.keyboard_arrow_right),
        ),
      ],
    ),
  );

  List<Widget> _buildEmptyDayReleasesList(
    final BuildContext context,
    final Padding daysNavigationBar,
  ) => <Widget>[
    _buildCalendar(),
    daysNavigationBar,
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
            style: const TextStyle(color: Colors.grey, fontSize: 24),
          ),
          Text(
            AppLocalizations.of(context)!.noAnimeToday,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    ),
  ];

  List<Widget> _buildFullList(
    final BuildContext context,
    final WeekDayDto currentWeekDay,
    final Padding daysNavigationBar,
  ) => <Widget>[
    _buildCalendar(),
    daysNavigationBar,
    ...wb.WidgetBuilder.instance.buildRowWidgets(
      currentWeekDay.releases.map(
        (final WeekDayReleaseDto release) => CalendarAnimeComponent(
          key: Key(release.anime.uuid),
          release: release,
        ),
      ),
      maxElementsPerRow: AnimeWeeklyController.instance.maxElementsPerRow(
        context,
      ),
    ),
  ];

  @override
  Widget build(final BuildContext context) => StreamBuilder<List<WeekDayDto>>(
    stream: AnimeWeeklyController.instance.streamController.stream,
    initialData: AnimeWeeklyController.instance.items,
    builder: (
      final BuildContext context,
      final AsyncSnapshot<List<WeekDayDto>> snapshot,
    ) {
      final List<Widget> list = _buildList(context, snapshot.data!);

      return RefreshIndicator.adaptive(
        onRefresh: () async {
          await AnimeWeeklyController.instance.init();
        },
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          controller: AnimeWeeklyController.instance.scrollController,
          itemCount: list.length,
          itemBuilder:
              (final BuildContext context, final int index) => list[index],
        ),
      );
    },
  );
}
