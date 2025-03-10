import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grouped_episode_dto.freezed.dart';
part 'grouped_episode_dto.g.dart';

@freezed
sealed class GroupedEpisodeDto with _$GroupedEpisodeDto {
  const factory GroupedEpisodeDto({
    required final AnimeDto anime,
    required final List<PlatformDto> platforms,
    required final String releaseDateTime,
    required final String lastUpdateDateTime,
    required final String season,
    required final String episodeType,
    required final String number,
    required final List<String> langTypes,
    required final String? title,
    required final String? description,
    required final int? duration,
    required final List<String> mappings,
    required final List<String> urls,
  }) = _GroupedEpisodeDto;

  factory GroupedEpisodeDto.fromJson(final Map<String, dynamic> json) =>
      _$GroupedEpisodeDtoFromJson(json);
}
