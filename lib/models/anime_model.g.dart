// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
  json['uuid'] as String,
  json['shortName'] as String,
  (json['langTypes'] as List<dynamic>)
      .map((e) => $enumDecode(_$LangTypeEnumMap, e))
      .toList(),
  (json['platformIds'] as List<dynamic>)
      .map((e) => AnimePlatformModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

const _$LangTypeEnumMap = {
  LangType.subtitles: 'SUBTITLES',
  LangType.voice: 'VOICE',
};
