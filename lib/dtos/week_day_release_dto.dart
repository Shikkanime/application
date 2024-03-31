import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_day_release_dto.freezed.dart';
part 'week_day_release_dto.g.dart';

@freezed
class WeekDayReleaseDto with _$WeekDayReleaseDto {
  const factory WeekDayReleaseDto({
    required AnimeDto anime,
    required String releaseDateTime,
    required List<PlatformDto> platforms,
  }) = _WeekDayReleaseDto;

  factory WeekDayReleaseDto.fromJson(Map<String, dynamic> json) =>
      _$WeekDayReleaseDtoFromJson(json);
}
