// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_mapping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeMappingModel _$EpisodeMappingModelFromJson(Map<String, dynamic> json) =>
    EpisodeMappingModel(
      json['uuid'] as String,
      (json['sources'] as List<dynamic>)
          .map((e) => SourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
