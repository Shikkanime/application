import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/week_day_dto.dart';
import 'package:application/utils/http_request.dart';

class AnimeWeeklyController extends GenericController<WeekDayDto> {
  AnimeWeeklyController() : super(addScrollListener: false);

  static final AnimeWeeklyController instance = AnimeWeeklyController();
  bool memberMode = false;
  bool _isRetry = false;
  int selectedDay = DateTime.now().weekday - 1;

  @override
  Future<Iterable<WeekDayDto>> fetchItems() async {
    final List<dynamic> json = await HttpRequest.instance.get<List<dynamic>>(
      '/v1/animes/weekly',
      token: memberMode ? MemberController.instance.member?.token : null,
      onUnauthorized:
          memberMode
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

    return json.map(
      (final dynamic e) => WeekDayDto.fromJson(e as Map<String, dynamic>),
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
