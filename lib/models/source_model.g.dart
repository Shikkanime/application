// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) => SourceModel(
  PlatformModel.fromJson(json['platform'] as Map<String, dynamic>),
  json['url'] as String,
  $enumDecode(_$LangTypeEnumMap, json['langType']),
);

const _$LangTypeEnumMap = {
  LangType.subtitles: 'SUBTITLES',
  LangType.voice: 'VOICE',
};
