import 'package:application/dtos/tag_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_tag_dto.freezed.dart';
part 'anime_tag_dto.g.dart';

@freezed
sealed class AnimeTagDto with _$AnimeTagDto {
  const factory AnimeTagDto({
    required final String uuid,
    required final TagDto tag,
    required final bool isAdult,
    required final bool isSpoiler,
  }) = _AnimeTagDto;

  factory AnimeTagDto.fromJson(final Map<String, dynamic> json) =>
      _$AnimeTagDtoFromJson(json);
}
