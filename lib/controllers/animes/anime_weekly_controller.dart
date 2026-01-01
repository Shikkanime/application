import 'dart:math';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/controllers/searchable_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/enums/search_type.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

class AnimeWeeklyController extends GenericController<WeekDayDto>
    implements SearchableController {
  AnimeWeeklyController() : super(addScrollListener: false);

  static final AnimeWeeklyController instance = AnimeWeeklyController();

  bool _isRetry = false;
  int selectedDay = DateTime.now().weekday - 1;

  bool isWatchlist = false;
  @override
  SearchType? searchType;

  @override
  Future<void> onSearchTypeChanged() => init();

  int maxElementsPerRow(final BuildContext context) =>
      max(1, (MediaQuery.sizeOf(context).width * 0.0025).floor());

  double placeholderHeight(final BuildContext context) =>
      MediaQuery.sizeOf(context).width * 0.46 / maxElementsPerRow(context);

  @override
  Future<Pair<Iterable<WeekDayDto>, int>> fetchItems() async {
    final List<dynamic> json = await HttpRequest.instance.get<List<dynamic>>(
      '/v1/animes/weekly',
      query: <String, Object>{
        if (searchType != null) 'searchTypes': searchType!.name.toUpperCase(),
      },
      token: isWatchlist ? MemberController.instance.member?.token : null,
      onUnauthorized: isWatchlist
          ? () async {
              if (_isRetry) {
                return;
              }

              _isRetry = true;
              await MemberController.instance.login();
              await fetchItems();
            }
          : null,
    );

    _isRetry = false;

    return Pair<Iterable<WeekDayDto>, int>(
      json.map(
        (final dynamic e) => WeekDayDto.fromJson(e as Map<String, dynamic>),
      ),
      json.length,
    );
  }

  void previousDay() {
    selectedDay = (selectedDay - 1) % 7;
    streamController.add(items);
  }

  void nextDay() {
    selectedDay = (selectedDay + 1) % 7;
    streamController.add(items);
  }
}
