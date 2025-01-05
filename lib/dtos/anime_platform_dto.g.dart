// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_platform_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimePlatformDtoImpl _$$AnimePlatformDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimePlatformDtoImpl(
      uuid: json['uuid'] as String,
      platform: PlatformDto.fromJson(json['platform'] as Map<String, dynamic>),
      platformId: json['platformId'] as String,
    );

Map<String, dynamic> _$$AnimePlatformDtoImplToJson(
        _$AnimePlatformDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'platform': instance.platform,
      'platformId': instance.platformId,
    };
