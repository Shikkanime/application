// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonDtoImpl _$$SeasonDtoImplFromJson(Map<String, dynamic> json) =>
    _$SeasonDtoImpl(
      number: (json['number'] as num).toInt(),
      lastReleaseDateTime: json['lastReleaseDateTime'] as String,
    );

Map<String, dynamic> _$$SeasonDtoImplToJson(_$SeasonDtoImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'lastReleaseDateTime': instance.lastReleaseDateTime,
    };
