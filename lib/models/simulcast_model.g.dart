// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulcast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimulcastModel _$SimulcastModelFromJson(Map<String, dynamic> json) =>
    SimulcastModel(
      json['uuid'] as String,
      $enumDecode(_$SeasonEnumMap, json['season']),
      (json['year'] as num).toInt(),
    );

const _$SeasonEnumMap = {
  Season.spring: 'SPRING',
  Season.summer: 'SUMMER',
  Season.autumn: 'AUTUMN',
  Season.winter: 'WINTER',
};
