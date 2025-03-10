// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_mapping_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeMappingDto _$EpisodeMappingDtoFromJson(
  Map<String, dynamic> json,
) => _EpisodeMappingDto(
  uuid: json['uuid'] as String,
  anime:
      json['anime'] == null
          ? null
          : AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
  releaseDateTime: json['releaseDateTime'] as String,
  lastUpdateDateTime: json['lastUpdateDateTime'] as String,
  season: (json['season'] as num).toInt(),
  episodeType: json['episodeType'] as String,
  number: (json['number'] as num).toInt(),
  duration: (json['duration'] as num).toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => EpisodeVariantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  platforms:
      (json['platforms'] as List<dynamic>?)
          ?.map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
          .toList(),
  langTypes:
      (json['langTypes'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$EpisodeMappingDtoToJson(_EpisodeMappingDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'anime': instance.anime,
      'releaseDateTime': instance.releaseDateTime,
      'lastUpdateDateTime': instance.lastUpdateDateTime,
      'season': instance.season,
      'episodeType': instance.episodeType,
      'number': instance.number,
      'duration': instance.duration,
      'title': instance.title,
      'description': instance.description,
      'variants': instance.variants,
      'platforms': instance.platforms,
      'langTypes': instance.langTypes,
    };
