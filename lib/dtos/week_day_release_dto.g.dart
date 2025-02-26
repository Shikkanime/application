// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day_release_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekDayReleaseDto _$WeekDayReleaseDtoFromJson(Map<String, dynamic> json) =>
    _WeekDayReleaseDto(
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      platforms:
          (json['platforms'] as List<dynamic>)
              .map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      releaseDateTime: json['releaseDateTime'] as String,
      slug: json['slug'] as String,
      langTypes:
          (json['langTypes'] as List<dynamic>).map((e) => e as String).toList(),
      episodeType: json['episodeType'] as String?,
      minNumber: (json['minNumber'] as num?)?.toInt(),
      maxNumber: (json['maxNumber'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      mappings:
          (json['mappings'] as List<dynamic>?)
              ?.map(
                (e) => EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$WeekDayReleaseDtoToJson(_WeekDayReleaseDto instance) =>
    <String, dynamic>{
      'anime': instance.anime,
      'platforms': instance.platforms,
      'releaseDateTime': instance.releaseDateTime,
      'slug': instance.slug,
      'langTypes': instance.langTypes,
      'episodeType': instance.episodeType,
      'minNumber': instance.minNumber,
      'maxNumber': instance.maxNumber,
      'number': instance.number,
      'mappings': instance.mappings,
    };
