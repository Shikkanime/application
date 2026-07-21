// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshMemberDto _$RefreshMemberDtoFromJson(Map<String, dynamic> json) =>
    _RefreshMemberDto(
      missedAnimes: PageableDto.fromJson(
        json['missedAnimes'] as Map<String, dynamic>,
      ),
      followedAnimes: PageableDto.fromJson(
        json['followedAnimes'] as Map<String, dynamic>,
      ),
      followedEpisodes: PageableDto.fromJson(
        json['followedEpisodes'] as Map<String, dynamic>,
      ),
      totalDuration: (json['totalDuration'] as num).toInt(),
      totalUnseenDuration: (json['totalUnseenDuration'] as num).toInt(),
    );

Map<String, dynamic> _$RefreshMemberDtoToJson(_RefreshMemberDto instance) =>
    <String, dynamic>{
      'missedAnimes': instance.missedAnimes,
      'followedAnimes': instance.followedAnimes,
      'followedEpisodes': instance.followedEpisodes,
      'totalDuration': instance.totalDuration,
      'totalUnseenDuration': instance.totalUnseenDuration,
    };
