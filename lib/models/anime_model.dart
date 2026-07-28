import 'package:application/models/anime_platform_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable(createToJson: false)
class AnimeModel {
  final String uuid;
  final String shortName;
  final List<LangType> langTypes;
  final List<AnimePlatformModel> platformIds;

  AnimeModel(this.uuid, this.shortName, this.langTypes, this.platformIds);

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}
