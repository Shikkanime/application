import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable_dto.freezed.dart';
part 'pageable_dto.g.dart';

@freezed
class PageableDto with _$PageableDto {
  const factory PageableDto({
    required List<dynamic> data,
    required int page,
    required int limit,
    required int total,
  }) = _PageableDto;

  factory PageableDto.fromJson(Map<String, dynamic> json) =>
      _$PageableDtoFromJson(json);
}
