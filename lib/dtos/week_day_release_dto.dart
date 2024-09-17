import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_day_release_dto.freezed.dart';
part 'week_day_release_dto.g.dart';

@freezed
class WeekDayReleaseDto with _$WeekDayReleaseDto {
  const factory WeekDayReleaseDto({
    required AnimeDto anime,
    required List<PlatformDto> platforms,
    required String releaseDateTime,
    required String slug,
    required String langType,
    required String? episodeType,
    required int? minNumber,
    required int? maxNumber,
    required int? number,
    required List<EpisodeMappingDto>? mappings,
  }) = _WeekDayReleaseDto;

  factory WeekDayReleaseDto.fromJson(Map<String, dynamic> json) =>
      _$WeekDayReleaseDtoFromJson(json);
}
