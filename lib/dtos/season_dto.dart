import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_dto.freezed.dart';
part 'season_dto.g.dart';

@freezed
class SeasonDto with _$SeasonDto {
  const factory SeasonDto({
    required int number,
    required String lastReleaseDateTime,
  }) = _SeasonDto;

  factory SeasonDto.fromJson(Map<String, dynamic> json) =>
      _$SeasonDtoFromJson(json);
}
