import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_platform_dto.freezed.dart';
part 'anime_platform_dto.g.dart';

@freezed
class AnimePlatformDto with _$AnimePlatformDto {
  const factory AnimePlatformDto({
    required final String uuid,
    required final PlatformDto platform,
    required final String platformId,
  }) = _AnimePlatformDto;

  factory AnimePlatformDto.fromJson(final Map<String, dynamic> json) =>
      _$AnimePlatformDtoFromJson(json);
}
