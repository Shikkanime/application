// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeTagDto _$AnimeTagDtoFromJson(Map<String, dynamic> json) => _AnimeTagDto(
  uuid: json['uuid'] as String,
  tag: TagDto.fromJson(json['tag'] as Map<String, dynamic>),
  isAdult: json['isAdult'] as bool,
  isSpoiler: json['isSpoiler'] as bool,
);

Map<String, dynamic> _$AnimeTagDtoToJson(_AnimeTagDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'tag': instance.tag,
      'isAdult': instance.isAdult,
      'isSpoiler': instance.isSpoiler,
    };
