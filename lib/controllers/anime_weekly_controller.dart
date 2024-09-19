import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/utils/http_request.dart';

class AnimeWeeklyController extends GenericController<WeekDayDto> {
  static final instance = AnimeWeeklyController();
  bool memberMode = false;

  AnimeWeeklyController() : super(addScrollListener: false);

  @override
  Future<Iterable<WeekDayDto>> fetchItems() async {
    final json = await HttpRequest.instance.get<List>(
      '/v1/animes/weekly',
      token: memberMode ? MemberController.instance.member?.token : null,
    );

    return json.map((e) => WeekDayDto.fromJson(e as Map<String, dynamic>));
  }
}
