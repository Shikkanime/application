import 'package:application/models/platform_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_platform_model.g.dart';

@JsonSerializable(createToJson: false)
class AnimePlatformModel {
  final PlatformModel platform;

  AnimePlatformModel(this.platform);

  factory AnimePlatformModel.fromJson(Map<String, dynamic> json) =>
      _$AnimePlatformModelFromJson(json);
}
