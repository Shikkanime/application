import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_dto.freezed.dart';
part 'member_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MemberDto with _$MemberDto {
  const factory MemberDto({
    required String uuid,
    required String token,
    required String creationDateTime,
    required String lastUpdateDateTime,
    required bool isPrivate,
    required String? email,
    required List<String> followedAnimes,
    required List<String> followedEpisodes,
    required int totalDuration,
    required int totalUnseenDuration,
    required bool hasProfilePicture,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
