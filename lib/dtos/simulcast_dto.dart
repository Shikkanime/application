import 'package:freezed_annotation/freezed_annotation.dart';

part 'simulcast_dto.freezed.dart';
part 'simulcast_dto.g.dart';

@freezed
class SimulcastDto with _$SimulcastDto {
  const factory SimulcastDto({
    required final String uuid,
    required final String season,
    required final int year,
    required final String slug,
    required final String label,
  }) = _SimulcastDto;

  factory SimulcastDto.fromJson(final Map<String, dynamic> json) =>
      _$SimulcastDtoFromJson(json);
}
