// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulcast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SimulcastDto _$SimulcastDtoFromJson(Map<String, dynamic> json) =>
    _SimulcastDto(
      uuid: json['uuid'] as String,
      season: json['season'] as String,
      year: (json['year'] as num).toInt(),
      slug: json['slug'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$SimulcastDtoToJson(_SimulcastDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'season': instance.season,
      'year': instance.year,
      'slug': instance.slug,
      'label': instance.label,
    };
