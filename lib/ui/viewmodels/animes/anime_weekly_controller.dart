import 'dart:math';

import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/member_controller.dart';
import 'package:application/ui/viewmodels/searchable_controller.dart';
import 'package:application/data/models/week_day_dto.dart';
import 'package:application/data/models/enums/search_type.dart';
import 'package:application/core/network/http_request.dart';
import 'package:application/core/network/api_result.dart';
import 'package:flutter/material.dart';

class AnimeWeeklyController extends GenericController<WeekDayDto>
    implements SearchableController {
  static final AnimeWeeklyController instance = AnimeWeeklyController();
  final ApiClient _client = const ApiClient();

  AnimeWeeklyController() : super(addScrollListener: false);

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
    final ApiResult<List<dynamic>> result = await _client.get<List<dynamic>>(
      '/v1/animes/weekly',
      query: <String, Object>{
        if (searchType != null) 'searchTypes': searchType!.name.toUpperCase(),
      },
      token: isWatchlist ? MemberController.instance.member?.token : null,
    );

    return switch (result) {
      ApiSuccess<List<dynamic>>(:final data) => Pair<Iterable<WeekDayDto>, int>(
        data.map(
          (final dynamic e) => WeekDayDto.fromJson(e as Map<String, dynamic>),
        ),
        data.length,
      ),
      ApiFailure<List<dynamic>>(:final error) => throw Exception(
        'Failed to load weekly animes: $error',
      ),
    };
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
