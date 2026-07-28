import 'package:application/models/source_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_mapping_model.g.dart';

@JsonSerializable(createToJson: false)
class EpisodeMappingModel {
  final String uuid;
  final List<SourceModel> sources;

  EpisodeMappingModel(this.uuid, this.sources);

  factory EpisodeMappingModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeMappingModelFromJson(json);
}
