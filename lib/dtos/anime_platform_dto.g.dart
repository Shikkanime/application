// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_platform_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimePlatformDto _$AnimePlatformDtoFromJson(Map<String, dynamic> json) =>
    _AnimePlatformDto(
      uuid: json['uuid'] as String,
      platform: PlatformDto.fromJson(json['platform'] as Map<String, dynamic>),
      platformId: json['platformId'] as String,
    );

Map<String, dynamic> _$AnimePlatformDtoToJson(_AnimePlatformDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'platform': instance.platform,
      'platformId': instance.platformId,
    };
