import 'package:application/dtos/anime_platform_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/dtos/season_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_dto.freezed.dart';
part 'anime_dto.g.dart';

@freezed
sealed class AnimeDto with _$AnimeDto {
  const factory AnimeDto({
    required final String uuid,
    required final String countryCode,
    required final String name,
    required final String shortName,
    required final String slug,
    required final String releaseDateTime,
    required final String? description,
    required final List<String>? langTypes,
    required final List<SeasonDto>? seasons,
    required final List<AnimePlatformDto>? platformIds,
  }) = _AnimeDto;

  factory AnimeDto.fromJson(final Map<String, dynamic> json) =>
      _$AnimeDtoFromJson(json);
}

extension AnimeDtoExtension on AnimeDto {
  List<PlatformDto> get platforms =>
      platformIds != null && platformIds!.isNotEmpty
          ? platformIds!
              .map((final AnimePlatformDto e) => e.platform)
              .toSet()
              .toList()
          : <PlatformDto>[];
}
