// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeekDayDtoImpl _$$WeekDayDtoImplFromJson(Map<String, dynamic> json) =>
    _$WeekDayDtoImpl(
      dayOfWeek: json['dayOfWeek'] as String,
      releases: (json['releases'] as List<dynamic>)
          .map((e) => WeekDayReleaseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeekDayDtoImplToJson(_$WeekDayDtoImpl instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'releases': instance.releases,
    };
