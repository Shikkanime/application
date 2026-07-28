// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupedEpisodeModel _$GroupedEpisodeModelFromJson(Map<String, dynamic> json) =>
    GroupedEpisodeModel(
      AnimeModel.fromJson(json['anime'] as Map<String, dynamic>),
      json['season'] as String,
      $enumDecode(_$EpisodeTypeEnumMap, json['episodeType']),
      json['number'] as String,
      (json['mappings'] as List<dynamic>).map((e) => e as String).toList(),
      (json['sources'] as List<dynamic>)
          .map((e) => SourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$EpisodeTypeEnumMap = {
  EpisodeType.episode: 'EPISODE',
  EpisodeType.film: 'FILM',
  EpisodeType.special: 'SPECIAL',
  EpisodeType.summary: 'SUMMARY',
  EpisodeType.spinOff: 'SPIN_OFF',
};
