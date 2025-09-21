import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_source_dto.freezed.dart';
part 'episode_source_dto.g.dart';

@freezed
sealed class EpisodeSourceDto with _$EpisodeSourceDto {
  const factory EpisodeSourceDto({
    required final PlatformDto platform,
    required final String url,
    required final String langType,
  }) = _EpisodeSourceDto;

  factory EpisodeSourceDto.fromJson(final Map<String, dynamic> json) =>
      _$EpisodeSourceDtoFromJson(json);
}
