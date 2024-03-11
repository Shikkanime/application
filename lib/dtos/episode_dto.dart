import 'package:application/dtos/anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_dto.freezed.dart';
part 'episode_dto.g.dart';

@freezed
class EpisodeDto with _$EpisodeDto {
  const factory EpisodeDto({
    required String uuid,
    required String platform,
    required AnimeDto anime,
    required String episodeType,
    required String langType,
    required String hash,
    required String releaseDateTime,
    required int season,
    required int number,
    required String? title,
    required String url,
    required String image,
    required int duration,
    required String? description,
    required bool uncensored,
    required String lastUpdateDateTime,
    required String status,
  }) = _EpisodeDto;

  factory EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDtoFromJson(json);
}
