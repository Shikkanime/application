import 'package:application/models/anime_model.dart';
import 'package:application/models/episode_mapping_model.dart';
import 'package:application/models/episode_type.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/platform_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekly_release_model.g.dart';

@JsonSerializable(createToJson: false)
class WeeklyReleaseModel {
  final AnimeModel anime;
  final DateTime releaseDateTime;
  final EpisodeType episodeType;
  final List<LangType> langTypes;
  final List<PlatformModel> platforms;
  final int? minNumber;
  final int? maxNumber;
  final int? number;
  final List<EpisodeMappingModel>? mappings;

  WeeklyReleaseModel(
    this.anime,
    this.releaseDateTime,
    this.episodeType,
    this.langTypes,
    this.platforms,
    this.minNumber,
    this.maxNumber,
    this.number,
    this.mappings,
  );

  factory WeeklyReleaseModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyReleaseModelFromJson(json);
}
