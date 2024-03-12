// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeDtoImpl _$$EpisodeDtoImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeDtoImpl(
      uuid: json['uuid'] as String,
      platform: PlatformDto.fromJson(json['platform'] as Map<String, dynamic>),
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      episodeType: json['episodeType'] as String,
      langType: json['langType'] as String,
      hash: json['hash'] as String,
      releaseDateTime: json['releaseDateTime'] as String,
      season: json['season'] as int,
      number: json['number'] as int,
      title: json['title'] as String?,
      url: json['url'] as String,
      image: json['image'] as String,
      duration: json['duration'] as int,
      description: json['description'] as String?,
      uncensored: json['uncensored'] as bool,
      lastUpdateDateTime: json['lastUpdateDateTime'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$EpisodeDtoImplToJson(_$EpisodeDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'platform': instance.platform,
      'anime': instance.anime,
      'episodeType': instance.episodeType,
      'langType': instance.langType,
      'hash': instance.hash,
      'releaseDateTime': instance.releaseDateTime,
      'season': instance.season,
      'number': instance.number,
      'title': instance.title,
      'url': instance.url,
      'image': instance.image,
      'duration': instance.duration,
      'description': instance.description,
      'uncensored': instance.uncensored,
      'lastUpdateDateTime': instance.lastUpdateDateTime,
      'status': instance.status,
    };
