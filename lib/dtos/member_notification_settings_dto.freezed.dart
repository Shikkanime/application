// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_notification_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberNotificationSettingsDto {

 String get type; List<PlatformDto> get platforms;
/// Create a copy of MemberNotificationSettingsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberNotificationSettingsDtoCopyWith<MemberNotificationSettingsDto> get copyWith => _$MemberNotificationSettingsDtoCopyWithImpl<MemberNotificationSettingsDto>(this as MemberNotificationSettingsDto, _$identity);

  /// Serializes this MemberNotificationSettingsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberNotificationSettingsDto&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.platforms, platforms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(platforms));

@override
String toString() {
  return 'MemberNotificationSettingsDto(type: $type, platforms: $platforms)';
}


}

/// @nodoc
abstract mixin class $MemberNotificationSettingsDtoCopyWith<$Res>  {
  factory $MemberNotificationSettingsDtoCopyWith(MemberNotificationSettingsDto value, $Res Function(MemberNotificationSettingsDto) _then) = _$MemberNotificationSettingsDtoCopyWithImpl;
@useResult
$Res call({
 String type, List<PlatformDto> platforms
});




}
/// @nodoc
class _$MemberNotificationSettingsDtoCopyWithImpl<$Res>
    implements $MemberNotificationSettingsDtoCopyWith<$Res> {
  _$MemberNotificationSettingsDtoCopyWithImpl(this._self, this._then);

  final MemberNotificationSettingsDto _self;
  final $Res Function(MemberNotificationSettingsDto) _then;

/// Create a copy of MemberNotificationSettingsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? platforms = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MemberNotificationSettingsDto implements MemberNotificationSettingsDto {
  const _MemberNotificationSettingsDto({required this.type, required this.platforms});
  factory _MemberNotificationSettingsDto.fromJson(Map<String, dynamic> json) => _$MemberNotificationSettingsDtoFromJson(json);

@override final  String type;
@override final  List<PlatformDto> platforms;

/// Create a copy of MemberNotificationSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberNotificationSettingsDtoCopyWith<_MemberNotificationSettingsDto> get copyWith => __$MemberNotificationSettingsDtoCopyWithImpl<_MemberNotificationSettingsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberNotificationSettingsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberNotificationSettingsDto&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.platforms, platforms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(platforms));

@override
String toString() {
  return 'MemberNotificationSettingsDto(type: $type, platforms: $platforms)';
}


}

/// @nodoc
abstract mixin class _$MemberNotificationSettingsDtoCopyWith<$Res> implements $MemberNotificationSettingsDtoCopyWith<$Res> {
  factory _$MemberNotificationSettingsDtoCopyWith(_MemberNotificationSettingsDto value, $Res Function(_MemberNotificationSettingsDto) _then) = __$MemberNotificationSettingsDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, List<PlatformDto> platforms
});




}
/// @nodoc
class __$MemberNotificationSettingsDtoCopyWithImpl<$Res>
    implements _$MemberNotificationSettingsDtoCopyWith<$Res> {
  __$MemberNotificationSettingsDtoCopyWithImpl(this._self, this._then);

  final _MemberNotificationSettingsDto _self;
  final $Res Function(_MemberNotificationSettingsDto) _then;

/// Create a copy of MemberNotificationSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? platforms = null,}) {
  return _then(_MemberNotificationSettingsDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,
  ));
}


}

// dart format on
