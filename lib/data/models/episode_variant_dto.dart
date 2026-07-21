import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_variant_dto.freezed.dart';
part 'episode_variant_dto.g.dart';

@freezed
sealed class EpisodeVariantDto with _$EpisodeVariantDto {
  const factory EpisodeVariantDto({
    required final String uuid,
    required final String url,
  }) = _EpisodeVariantDto;

  factory EpisodeVariantDto.fromJson(final Map<String, dynamic> json) =>
      _$EpisodeVariantDtoFromJson(json);
}
