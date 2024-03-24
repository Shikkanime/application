// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulcast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimulcastDtoImpl _$$SimulcastDtoImplFromJson(Map<String, dynamic> json) =>
    _$SimulcastDtoImpl(
      uuid: json['uuid'] as String,
      season: json['season'] as String,
      year: json['year'] as int,
      slug: json['slug'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$SimulcastDtoImplToJson(_$SimulcastDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'season': instance.season,
      'year': instance.year,
      'slug': instance.slug,
      'label': instance.label,
    };
