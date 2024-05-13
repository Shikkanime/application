import 'package:application/dtos/anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'missed_anime_dto.freezed.dart';
part 'missed_anime_dto.g.dart';

@freezed
class MissedAnimeDto with _$MissedAnimeDto {
  const factory MissedAnimeDto({
    required AnimeDto anime,
    required int episodeMissed,
  }) = _MissedAnimeDto;

  factory MissedAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$MissedAnimeDtoFromJson(json);
}
