// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_release_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyReleaseModel _$WeeklyReleaseModelFromJson(Map<String, dynamic> json) =>
    WeeklyReleaseModel(
      AnimeModel.fromJson(json['anime'] as Map<String, dynamic>),
      DateTime.parse(json['releaseDateTime'] as String),
      $enumDecode(_$EpisodeTypeEnumMap, json['episodeType']),
      (json['langTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$LangTypeEnumMap, e))
          .toList(),
      (json['platforms'] as List<dynamic>)
          .map((e) => PlatformModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['minNumber'] as num?)?.toInt(),
      (json['maxNumber'] as num?)?.toInt(),
      (json['number'] as num?)?.toInt(),
      (json['mappings'] as List<dynamic>?)
          ?.map((e) => EpisodeMappingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$EpisodeTypeEnumMap = {
  EpisodeType.episode: 'EPISODE',
  EpisodeType.film: 'FILM',
  EpisodeType.special: 'SPECIAL',
  EpisodeType.summary: 'SUMMARY',
  EpisodeType.spinOff: 'SPIN_OFF',
};

const _$LangTypeEnumMap = {
  LangType.subtitles: 'SUBTITLES',
  LangType.voice: 'VOICE',
};
