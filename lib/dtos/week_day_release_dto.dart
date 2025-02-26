import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_day_release_dto.freezed.dart';
part 'week_day_release_dto.g.dart';

@freezed
sealed class WeekDayReleaseDto with _$WeekDayReleaseDto {
  const factory WeekDayReleaseDto({
    required final AnimeDto anime,
    required final List<PlatformDto> platforms,
    required final String releaseDateTime,
    required final String slug,
    required final List<String> langTypes,
    required final String? episodeType,
    required final int? minNumber,
    required final int? maxNumber,
    required final int? number,
    required final List<EpisodeMappingDto>? mappings,
  }) = _WeekDayReleaseDto;

  factory WeekDayReleaseDto.fromJson(final Map<String, dynamic> json) =>
      _$WeekDayReleaseDtoFromJson(json);
}
