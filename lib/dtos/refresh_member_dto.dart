import 'package:application/dtos/pageable_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_member_dto.freezed.dart';
part 'refresh_member_dto.g.dart';

@freezed
sealed class RefreshMemberDto with _$RefreshMemberDto {
  const factory RefreshMemberDto({
    required final PageableDto missedAnimes,
    required final PageableDto followedAnimes,
    required final PageableDto followedEpisodes,
    required final int totalDuration,
    required final int totalUnseenDuration,
  }) = _RefreshMemberDto;

  factory RefreshMemberDto.fromJson(final Map<String, dynamic> json) =>
      _$RefreshMemberDtoFromJson(json);
}
