// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeDtoImpl _$$AnimeDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnimeDtoImpl(
      uuid: json['uuid'] as String,
      countryCode: json['countryCode'] as String,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      slug: json['slug'] as String,
      releaseDateTime: json['releaseDateTime'] as String,
      lastReleaseDateTime: json['lastReleaseDateTime'] as String,
      lastUpdateDateTime: json['lastUpdateDateTime'] as String?,
      image: json['image'] as String,
      banner: json['banner'] as String,
      description: json['description'] as String?,
      simulcasts: (json['simulcasts'] as List<dynamic>?)
          ?.map((e) => SimulcastDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      audioLocales: (json['audioLocales'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      langTypes: (json['langTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeasonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      platformIds: (json['platformIds'] as List<dynamic>?)
          ?.map((e) => AnimePlatformDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnimeDtoImplToJson(_$AnimeDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'countryCode': instance.countryCode,
      'name': instance.name,
      'shortName': instance.shortName,
      'slug': instance.slug,
      'releaseDateTime': instance.releaseDateTime,
      'lastReleaseDateTime': instance.lastReleaseDateTime,
      'lastUpdateDateTime': instance.lastUpdateDateTime,
      'image': instance.image,
      'banner': instance.banner,
      'description': instance.description,
      'simulcasts': instance.simulcasts,
      'audioLocales': instance.audioLocales,
      'langTypes': instance.langTypes,
      'seasons': instance.seasons,
      'status': instance.status,
      'platformIds': instance.platformIds,
    };
