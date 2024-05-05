// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day_release_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekDayReleaseDtoImpl _$$WeekDayReleaseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekDayReleaseDtoImpl(
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      releaseDateTime: json['releaseDateTime'] as String,
      langType: json['langType'] as String,
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      variant: json['variant'] == null
          ? null
          : EpisodeVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeekDayReleaseDtoImplToJson(
        _$WeekDayReleaseDtoImpl instance) =>
    <String, dynamic>{
      'anime': instance.anime,
      'releaseDateTime': instance.releaseDateTime,
      'langType': instance.langType,
      'platforms': instance.platforms,
      'variant': instance.variant,
    };
