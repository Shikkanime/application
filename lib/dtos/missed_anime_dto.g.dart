// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missed_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissedAnimeDtoImpl _$$MissedAnimeDtoImplFromJson(Map<String, dynamic> json) =>
    _$MissedAnimeDtoImpl(
      anime: AnimeDto.fromJson(json['anime'] as Map<String, dynamic>),
      episodeMissed: (json['episodeMissed'] as num).toInt(),
    );

Map<String, dynamic> _$$MissedAnimeDtoImplToJson(
        _$MissedAnimeDtoImpl instance) =>
    <String, dynamic>{
      'anime': instance.anime,
      'episodeMissed': instance.episodeMissed,
    };
