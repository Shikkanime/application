import 'package:application/dtos/season_dto.dart';
import 'package:application/dtos/simulcast_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_dto.freezed.dart';
part 'anime_dto.g.dart';

@freezed
class AnimeDto with _$AnimeDto {
  const factory AnimeDto({
    required String uuid,
    required String countryCode,
    required String name,
    required String shortName,
    required String slug,
    required String releaseDateTime,
    required String lastReleaseDateTime,
    required String image,
    required String? banner,
    required String? description,
    required List<SimulcastDto> simulcasts,
    required List<String> audioLocales,
    required List<String> langTypes,
    required List<SeasonDto> seasons,
    required String? status,
  }) = _AnimeDto;

  factory AnimeDto.fromJson(Map<String, dynamic> json) =>
      _$AnimeDtoFromJson(json);
}
