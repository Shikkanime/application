import 'package:json_annotation/json_annotation.dart';

part 'platform_model.g.dart';

@JsonSerializable(createToJson: false)
class PlatformModel {
  final String name;
  final String image;

  PlatformModel(this.name, this.image);

  factory PlatformModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformModelFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformModel &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
