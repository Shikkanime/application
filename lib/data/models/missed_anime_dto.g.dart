// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missed_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MissedAnimeDto _$MissedAnimeDtoFromJson(Map<String, dynamic> json) =>
    _MissedAnimeDto(
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      episodeMissed: (json['episodeMissed'] as num).toInt(),
    );

Map<String, dynamic> _$MissedAnimeDtoToJson(_MissedAnimeDto instance) =>
    <String, dynamic>{
      'anime': instance.anime,
      'episodeMissed': instance.episodeMissed,
    };
