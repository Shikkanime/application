import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_dto.freezed.dart';
part 'member_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class MemberDto with _$MemberDto {
  const factory MemberDto({
    required final String uuid,
    required final String token,
    required final String creationDateTime,
    required final String? email,
    required final List<String> followedAnimes,
    required final List<String> followedEpisodes,
    required final int totalDuration,
    required final int totalUnseenDuration,
    required final bool hasProfilePicture,
  }) = _MemberDto;

  factory MemberDto.fromJson(final Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
