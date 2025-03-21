import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_dto.freezed.dart';
part 'season_dto.g.dart';

@freezed
sealed class SeasonDto with _$SeasonDto {
  const factory SeasonDto({required final int number}) = _SeasonDto;

  factory SeasonDto.fromJson(final Map<String, dynamic> json) =>
      _$SeasonDtoFromJson(json);
}
