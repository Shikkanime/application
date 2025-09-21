// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_source_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeSourceDto _$EpisodeSourceDtoFromJson(Map<String, dynamic> json) =>
    _EpisodeSourceDto(
      platform: PlatformDto.fromJson(json['platform'] as Map<String, dynamic>),
      url: json['url'] as String,
      langType: json['langType'] as String,
    );

Map<String, dynamic> _$EpisodeSourceDtoToJson(_EpisodeSourceDto instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'url': instance.url,
      'langType': instance.langType,
    };
