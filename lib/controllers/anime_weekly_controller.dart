import 'dart:async';
import 'dart:convert';

import 'package:application/dtos/week_day_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      final response = await http.get(
        Uri.parse(
          '${Constant.apiUrl}/v1/animes/weekly',
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load weekly animes');
      }

      final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;

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
