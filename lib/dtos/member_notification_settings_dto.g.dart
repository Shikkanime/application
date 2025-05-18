// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_notification_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberNotificationSettingsDto _$MemberNotificationSettingsDtoFromJson(
  Map<String, dynamic> json,
) => _MemberNotificationSettingsDto(
  type: json['type'] as String,
  platforms:
      (json['platforms'] as List<dynamic>)
          .map((e) => PlatformDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MemberNotificationSettingsDtoToJson(
  _MemberNotificationSettingsDto instance,
) => <String, dynamic>{'type': instance.type, 'platforms': instance.platforms};
