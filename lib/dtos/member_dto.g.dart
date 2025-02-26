// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) => _MemberDto(
      uuid: json['uuid'] as String,
      token: json['token'] as String,
      creationDateTime: json['creationDateTime'] as String,
      lastUpdateDateTime: json['lastUpdateDateTime'] as String,
      isPrivate: json['isPrivate'] as bool,
      email: json['email'] as String?,
      followedAnimes: (json['followedAnimes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followedEpisodes: (json['followedEpisodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalDuration: (json['totalDuration'] as num).toInt(),
      totalUnseenDuration: (json['totalUnseenDuration'] as num).toInt(),
      hasProfilePicture: json['hasProfilePicture'] as bool,
    );

Map<String, dynamic> _$MemberDtoToJson(_MemberDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'token': instance.token,
      'creationDateTime': instance.creationDateTime,
      'lastUpdateDateTime': instance.lastUpdateDateTime,
      'isPrivate': instance.isPrivate,
      'email': instance.email,
      'followedAnimes': instance.followedAnimes,
      'followedEpisodes': instance.followedEpisodes,
      'totalDuration': instance.totalDuration,
      'totalUnseenDuration': instance.totalUnseenDuration,
      'hasProfilePicture': instance.hasProfilePicture,
    };
