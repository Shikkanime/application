import 'package:application/dtos/platform_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_notification_settings_dto.freezed.dart';
part 'member_notification_settings_dto.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class MemberNotificationSettingsDto with _$MemberNotificationSettingsDto {
  const factory MemberNotificationSettingsDto({
    required final String type,
    required final List<PlatformDto> platforms,
  }) = _MemberNotificationSettingsDto;

  factory MemberNotificationSettingsDto.fromJson(final Map<String, dynamic> json) =>
      _$MemberNotificationSettingsDtoFromJson(json);
}
