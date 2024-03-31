import 'package:application/dtos/week_day_release_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_day_dto.freezed.dart';
part 'week_day_dto.g.dart';

@freezed
class WeekDayDto with _$WeekDayDto {
  const factory WeekDayDto({
    required String dayOfWeek,
    required List<WeekDayReleaseDto> releases,
  }) = _WeekDayDto;

  factory WeekDayDto.fromJson(Map<String, dynamic> json) =>
      _$WeekDayDtoFromJson(json);
}
