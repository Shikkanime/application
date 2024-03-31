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
      platforms: (json['platforms'] as List<dynamic>)
          .map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeekDayReleaseDtoImplToJson(
        _$WeekDayReleaseDtoImpl instance) =>
    <String, dynamic>{
      'anime': instance.anime,
      'releaseDateTime': instance.releaseDateTime,
      'platforms': instance.platforms,
    };
