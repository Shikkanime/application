import 'package:application/models/lang_type.dart';
import 'package:application/models/platform_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@JsonSerializable(createToJson: false)
class SourceModel {
  final PlatformModel platform;
  final String url;
  final LangType langType;

  SourceModel(this.platform, this.url, this.langType);

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}
