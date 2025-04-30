// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_episode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupedEpisodeDto _$GroupedEpisodeDtoFromJson(Map<String, dynamic> json) =>
    _GroupedEpisodeDto(
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      platforms:
          (json['platforms'] as List<dynamic>)
              .map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      releaseDateTime: json['releaseDateTime'] as String,
      season: json['season'] as String,
      episodeType: json['episodeType'] as String,
      number: json['number'] as String,
      langTypes:
          (json['langTypes'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      mappings:
          (json['mappings'] as List<dynamic>).map((e) => e as String).toList(),
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GroupedEpisodeDtoToJson(_GroupedEpisodeDto instance) =>
    <String, dynamic>{
      'anime': instance.anime,
      'platforms': instance.platforms,
      'releaseDateTime': instance.releaseDateTime,
      'season': instance.season,
      'episodeType': instance.episodeType,
      'number': instance.number,
      'langTypes': instance.langTypes,
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration,
      'mappings': instance.mappings,
      'urls': instance.urls,
    };
