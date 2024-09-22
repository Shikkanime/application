import 'package:application/dtos/pageable_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_member_dto.freezed.dart';
part 'refresh_member_dto.g.dart';

@freezed
class RefreshMemberDto with _$RefreshMemberDto {
  const factory RefreshMemberDto({
    required PageableDto missedAnimes,
    required PageableDto followedAnimes,
    required PageableDto followedEpisodes,
    required int totalDuration,
    required int totalUnseenDuration,
  }) = _RefreshMemberDto;

  factory RefreshMemberDto.fromJson(Map<String, dynamic> json) =>
      _$RefreshMemberDtoFromJson(json);
}
