import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_variant_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_mapping_dto.freezed.dart';
part 'episode_mapping_dto.g.dart';

@freezed
sealed class EpisodeMappingDto with _$EpisodeMappingDto {
  const factory EpisodeMappingDto({
    required final String uuid,
    required final AnimeDto? anime,
    required final String releaseDateTime,
    required final String lastReleaseDateTime,
    required final String lastUpdateDateTime,
    required final String episodeType,
    required final int season,
    required final int number,
    required final int duration,
    required final String? title,
    required final String? description,
    required final String image,
    required final List<EpisodeVariantDto>? variants,
    required final List<PlatformDto>? platforms,
    required final List<String>? langTypes,
    required final String status,
  }) = _EpisodeMappingDto;

  factory EpisodeMappingDto.fromJson(final Map<String, dynamic> json) =>
      _$EpisodeMappingDtoFromJson(json);
}
