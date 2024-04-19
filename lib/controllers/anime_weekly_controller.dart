import 'dart:async';

import 'package:application/dtos/week_day_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

class AnimeWeeklyController {
  static AnimeWeeklyController instance = AnimeWeeklyController();
  final weekDays = <WeekDayDto>[];
  final scrollController = ScrollController();
  final streamController = StreamController<List<WeekDayDto>>.broadcast();
  bool isLoading = false;

  Future<void> init() async {
    weekDays.clear();
    streamController.add(weekDays);

    isLoading = false;
    await nextPage();
  }

  Future<void> goToTop() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    await init();
  }

  Future<void> nextPage() async {
    if (isLoading) {
      return;
    }

    isLoading = true;

    try {
      final json = await HttpRequest.instance.get<List>('/v1/animes/weekly');

      weekDays.addAll(
        json.map((e) => WeekDayDto.fromJson(e as Map<String, dynamic>)),
      );

      streamController.add(weekDays);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
