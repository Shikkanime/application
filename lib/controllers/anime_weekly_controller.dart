import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/utils/http_request.dart';

class AnimeWeeklyController extends GenericController<WeekDayDto> {
  AnimeWeeklyController() : super(addScrollListener: false);

  static final AnimeWeeklyController instance = AnimeWeeklyController();
  bool memberMode = false;

  @override
  Future<Iterable<WeekDayDto>> fetchItems() async {
    final List<dynamic> json = await HttpRequest.instance.get<List<dynamic>>(
      '/v2/animes/weekly',
      token: memberMode ? MemberController.instance.member?.token : null,
    );

    return json.map(
      (final dynamic e) => WeekDayDto.fromJson(e as Map<String, dynamic>),
    );
  }
}
