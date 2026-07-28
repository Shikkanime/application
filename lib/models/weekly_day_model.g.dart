// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyDayModel _$WeeklyDayModelFromJson(Map<String, dynamic> json) =>
    WeeklyDayModel(
      json['dayOfWeek'] as String,
      (json['releases'] as List<dynamic>)
          .map((e) => WeeklyReleaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
