// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeVariantDto _$EpisodeVariantDtoFromJson(Map<String, dynamic> json) =>
    _EpisodeVariantDto(
      uuid: json['uuid'] as String,
      releaseDateTime: json['releaseDateTime'] as String,
      platform: PlatformDto.fromJson(json['platform'] as Map<String, dynamic>),
      audioLocale: json['audioLocale'] as String,
      identifier: json['identifier'] as String,
      url: json['url'] as String,
      uncensored: json['uncensored'] as bool,
    );

Map<String, dynamic> _$EpisodeVariantDtoToJson(_EpisodeVariantDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'releaseDateTime': instance.releaseDateTime,
      'platform': instance.platform,
      'audioLocale': instance.audioLocale,
      'identifier': instance.identifier,
      'url': instance.url,
      'uncensored': instance.uncensored,
    };
