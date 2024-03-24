// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeDtoImpl _$$AnimeDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnimeDtoImpl(
      uuid: json['uuid'] as String,
      countryCode: json['countryCode'] as String,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      releaseDateTime: json['releaseDateTime'] as String,
      image: json['image'] as String,
      banner: json['banner'] as String?,
      description: json['description'] as String?,
      simulcasts: (json['simulcasts'] as List<dynamic>)
          .map((e) => SimulcastDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      slug: json['slug'] as String,
      lastReleaseDateTime: json['lastReleaseDateTime'] as String,
    );

Map<String, dynamic> _$$AnimeDtoImplToJson(_$AnimeDtoImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'countryCode': instance.countryCode,
      'name': instance.name,
      'shortName': instance.shortName,
      'releaseDateTime': instance.releaseDateTime,
      'image': instance.image,
      'banner': instance.banner,
      'description': instance.description,
      'simulcasts': instance.simulcasts,
      'status': instance.status,
      'slug': instance.slug,
      'lastReleaseDateTime': instance.lastReleaseDateTime,
    };
