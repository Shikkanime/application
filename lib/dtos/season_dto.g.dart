// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeasonDto _$SeasonDtoFromJson(Map<String, dynamic> json) => _SeasonDto(
  number: (json['number'] as num).toInt(),
  lastReleaseDateTime: json['lastReleaseDateTime'] as String,
);

Map<String, dynamic> _$SeasonDtoToJson(_SeasonDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'lastReleaseDateTime': instance.lastReleaseDateTime,
    };
