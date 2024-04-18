import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_variant_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_mapping_dto.freezed.dart';
part 'episode_mapping_dto.g.dart';

@freezed
class EpisodeMappingDto with _$EpisodeMappingDto {
  const factory EpisodeMappingDto({
    required String uuid,
    required AnimeDto anime,
    required String releaseDateTime,
    required String lastReleaseDateTime,
    required String lastUpdateDateTime,
    required String episodeType,
    required int season,
    required int number,
    required int duration,
    required String? title,
    required String? description,
    required String image,
    required List<EpisodeVariantDto> variants,
    required List<PlatformDto> platforms,
    required List<String> langTypes,
    required String status,
  }) = _EpisodeMappingDto;

  factory EpisodeMappingDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeMappingDtoFromJson(json);
}
