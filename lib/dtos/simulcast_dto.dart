import 'package:freezed_annotation/freezed_annotation.dart';

part 'simulcast_dto.freezed.dart';
part 'simulcast_dto.g.dart';

@freezed
class SimulcastDto with _$SimulcastDto {
  const factory SimulcastDto({
    required String uuid,
    required String season,
    required int year,
    required String slug,
    required String label,
  }) = _SimulcastDto;

  factory SimulcastDto.fromJson(Map<String, dynamic> json) =>
      _$SimulcastDtoFromJson(json);
}
