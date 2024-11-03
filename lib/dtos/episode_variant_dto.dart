import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_variant_dto.freezed.dart';
part 'episode_variant_dto.g.dart';

@freezed
class EpisodeVariantDto with _$EpisodeVariantDto {
  const factory EpisodeVariantDto({
    required final String uuid,
    required final String releaseDateTime,
    required final PlatformDto platform,
    required final String audioLocale,
    required final String identifier,
    required final String url,
    required final bool uncensored,
  }) = _EpisodeVariantDto;

  factory EpisodeVariantDto.fromJson(final Map<String, dynamic> json) =>
      _$EpisodeVariantDtoFromJson(json);
}
