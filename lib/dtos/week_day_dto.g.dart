// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekDayDto _$WeekDayDtoFromJson(Map<String, dynamic> json) => _WeekDayDto(
      dayOfWeek: json['dayOfWeek'] as String,
      releases: (json['releases'] as List<dynamic>)
          .map((e) => WeekDayReleaseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeekDayDtoToJson(_WeekDayDto instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'releases': instance.releases,
    };
