import 'package:application/models/season.dart';
import 'package:json_annotation/json_annotation.dart';

part 'simulcast_model.g.dart';

@JsonSerializable(createToJson: false)
class SimulcastModel {
  final String uuid;
  final Season season;
  final int year;

  SimulcastModel(this.uuid, this.season, this.year);

  factory SimulcastModel.fromJson(Map<String, dynamic> json) =>
      _$SimulcastModelFromJson(json);
}
