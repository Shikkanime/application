// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_mapping_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeMappingDtoImpl _$$EpisodeMappingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EpisodeMappingDtoImpl(
      uuid: json['uuid'] as String,
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      releaseDateTime: json['releaseDateTime'] as String,
      lastReleaseDateTime: json['lastReleaseDateTime'] as String,
      lastUpdateDateTime: json['lastUpdateDateTime'] as String,
      episodeType: json['episodeType'] as String,
      season: (json['season'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String,
      variants: (json['variants'] as List<dynamic>)
          .map((e) => EpisodeVariantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      langTypes:
          (json['langTypes'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$EpisodeMappingDtoImplToJson(
        _$EpisodeMappingDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'anime': instance.anime,
      'releaseDateTime': instance.releaseDateTime,
      'lastReleaseDateTime': instance.lastReleaseDateTime,
      'lastUpdateDateTime': instance.lastUpdateDateTime,
      'episodeType': instance.episodeType,
      'season': instance.season,
      'number': instance.number,
      'duration': instance.duration,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'variants': instance.variants,
      'platforms': instance.platforms,
      'langTypes': instance.langTypes,
      'status': instance.status,
    };
