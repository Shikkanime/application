import 'package:freezed_annotation/freezed_annotation.dart';

part 'pageable_dto.freezed.dart';
part 'pageable_dto.g.dart';

@freezed
class PageableDto with _$PageableDto {
  const factory PageableDto({
    required final List<dynamic> data,
    required final int page,
    required final int limit,
    required final int total,
  }) = _PageableDto;

  factory PageableDto.fromJson(final Map<String, dynamic> json) =>
      _$PageableDtoFromJson(json);
}
