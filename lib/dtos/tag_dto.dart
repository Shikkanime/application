import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
sealed class TagDto with _$TagDto {
  const factory TagDto({
    required final String uuid,
    required final String name,
  }) = _TagDto;

  factory TagDto.fromJson(final Map<String, dynamic> json) =>
      _$TagDtoFromJson(json);
}
