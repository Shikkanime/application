import 'package:application/models/weekly_release_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekly_day_model.g.dart';

@JsonSerializable(createToJson: false)
class WeeklyDayModel {
  final String dayOfWeek;
  final List<WeeklyReleaseModel> releases;

  WeeklyDayModel(this.dayOfWeek, this.releases);

  factory WeeklyDayModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyDayModelFromJson(json);
}
