import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_variant_dto.freezed.dart';
part 'episode_variant_dto.g.dart';

@freezed
class EpisodeVariantDto with _$EpisodeVariantDto {
  const factory EpisodeVariantDto({
    required String uuid,
    required String releaseDateTime,
    required PlatformDto platform,
    required String audioLocale,
    required String identifier,
    required String url,
    required bool uncensored,
  }) = _EpisodeVariantDto;

  factory EpisodeVariantDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeVariantDtoFromJson(json);
}
