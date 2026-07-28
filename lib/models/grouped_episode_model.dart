import 'package:application/models/anime_model.dart';
import 'package:application/models/episode_type.dart';
import 'package:application/models/source_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grouped_episode_model.g.dart';

@JsonSerializable(createToJson: false)
class GroupedEpisodeModel {
  final AnimeModel anime;
  final String season;
  final EpisodeType episodeType;
  final String number;
  final List<String> mappings;
  final List<SourceModel> sources;

  GroupedEpisodeModel(
    this.anime,
    this.season,
    this.episodeType,
    this.number,
    this.mappings,
    this.sources,
  );

  factory GroupedEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$GroupedEpisodeModelFromJson(json);
}
