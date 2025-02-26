import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_dto.freezed.dart';
part 'platform_dto.g.dart';

@freezed
sealed class PlatformDto with _$PlatformDto {
  const factory PlatformDto({
    required final String id,
    required final String name,
    required final String url,
    required final String image,
  }) = _PlatformDto;

  factory PlatformDto.fromJson(final Map<String, dynamic> json) =>
      _$PlatformDtoFromJson(json);
}
