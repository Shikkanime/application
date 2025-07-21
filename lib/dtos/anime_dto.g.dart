// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeDto _$AnimeDtoFromJson(Map<String, dynamic> json) => _AnimeDto(
  uuid: json['uuid'] as String,
  countryCode: json['countryCode'] as String,
  name: json['name'] as String,
  shortName: json['shortName'] as String,
  slug: json['slug'] as String,
  releaseDateTime: json['releaseDateTime'] as String,
  description: json['description'] as String?,
  langTypes: (json['langTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  seasons: (json['seasons'] as List<dynamic>?)
      ?.map((e) => SeasonDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  platformIds: (json['platformIds'] as List<dynamic>?)
      ?.map((e) => AnimePlatformDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  inWatchlist: json['inWatchlist'] as bool,
);

Map<String, dynamic> _$AnimeDtoToJson(_AnimeDto instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'countryCode': instance.countryCode,
  'name': instance.name,
  'shortName': instance.shortName,
  'slug': instance.slug,
  'releaseDateTime': instance.releaseDateTime,
  'description': instance.description,
  'langTypes': instance.langTypes,
  'seasons': instance.seasons,
  'platformIds': instance.platformIds,
  'inWatchlist': instance.inWatchlist,
};
