// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberDtoImpl _$$MemberDtoImplFromJson(Map<String, dynamic> json) =>
    _$MemberDtoImpl(
      uuid: json['uuid'] as String,
      token: json['token'] as String,
      creationDateTime: json['creationDateTime'] as String,
      lastUpdateDateTime: json['lastUpdateDateTime'] as String,
      isPrivate: json['isPrivate'] as bool,
      followedAnimes: (json['followedAnimes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followedEpisodes: (json['followedEpisodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalDuration: json['totalDuration'] as int,
    );

Map<String, dynamic> _$$MemberDtoImplToJson(_$MemberDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'token': instance.token,
      'creationDateTime': instance.creationDateTime,
      'lastUpdateDateTime': instance.lastUpdateDateTime,
      'isPrivate': instance.isPrivate,
      'followedAnimes': instance.followedAnimes,
      'followedEpisodes': instance.followedEpisodes,
      'totalDuration': instance.totalDuration,
    };