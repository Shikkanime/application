import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_dto.freezed.dart';
part 'platform_dto.g.dart';

@freezed
class PlatformDto with _$PlatformDto {
  const factory PlatformDto({
    required String id,
    required String name,
    required String url,
    required String image,
  }) = _PlatformDto;

  factory PlatformDto.fromJson(Map<String, dynamic> json) =>
      _$PlatformDtoFromJson(json);
}
