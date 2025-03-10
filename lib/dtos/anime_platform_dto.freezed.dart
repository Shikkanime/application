// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_platform_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimePlatformDto {

 String get uuid; PlatformDto get platform; String get platformId;
/// Create a copy of AnimePlatformDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimePlatformDtoCopyWith<AnimePlatformDto> get copyWith => _$AnimePlatformDtoCopyWithImpl<AnimePlatformDto>(this as AnimePlatformDto, _$identity);

  /// Serializes this AnimePlatformDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimePlatformDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.platformId, platformId) || other.platformId == platformId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,platform,platformId);

@override
String toString() {
  return 'AnimePlatformDto(uuid: $uuid, platform: $platform, platformId: $platformId)';
}


}

/// @nodoc
abstract mixin class $AnimePlatformDtoCopyWith<$Res>  {
  factory $AnimePlatformDtoCopyWith(AnimePlatformDto value, $Res Function(AnimePlatformDto) _then) = _$AnimePlatformDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, PlatformDto platform, String platformId
});


$PlatformDtoCopyWith<$Res> get platform;

}
/// @nodoc
class _$AnimePlatformDtoCopyWithImpl<$Res>
    implements $AnimePlatformDtoCopyWith<$Res> {
  _$AnimePlatformDtoCopyWithImpl(this._self, this._then);

  final AnimePlatformDto _self;
  final $Res Function(AnimePlatformDto) _then;

/// Create a copy of AnimePlatformDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? platform = null,Object? platformId = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformDto,platformId: null == platformId ? _self.platformId : platformId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AnimePlatformDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformDtoCopyWith<$Res> get platform {
  
  return $PlatformDtoCopyWith<$Res>(_self.platform, (value) {
    return _then(_self.copyWith(platform: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AnimePlatformDto implements AnimePlatformDto {
  const _AnimePlatformDto({required this.uuid, required this.platform, required this.platformId});
  factory _AnimePlatformDto.fromJson(Map<String, dynamic> json) => _$AnimePlatformDtoFromJson(json);

@override final  String uuid;
@override final  PlatformDto platform;
@override final  String platformId;

/// Create a copy of AnimePlatformDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimePlatformDtoCopyWith<_AnimePlatformDto> get copyWith => __$AnimePlatformDtoCopyWithImpl<_AnimePlatformDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimePlatformDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimePlatformDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.platformId, platformId) || other.platformId == platformId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,platform,platformId);

@override
String toString() {
  return 'AnimePlatformDto(uuid: $uuid, platform: $platform, platformId: $platformId)';
}


}

/// @nodoc
abstract mixin class _$AnimePlatformDtoCopyWith<$Res> implements $AnimePlatformDtoCopyWith<$Res> {
  factory _$AnimePlatformDtoCopyWith(_AnimePlatformDto value, $Res Function(_AnimePlatformDto) _then) = __$AnimePlatformDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, PlatformDto platform, String platformId
});


@override $PlatformDtoCopyWith<$Res> get platform;

}
/// @nodoc
class __$AnimePlatformDtoCopyWithImpl<$Res>
    implements _$AnimePlatformDtoCopyWith<$Res> {
  __$AnimePlatformDtoCopyWithImpl(this._self, this._then);

  final _AnimePlatformDto _self;
  final $Res Function(_AnimePlatformDto) _then;

/// Create a copy of AnimePlatformDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? platform = null,Object? platformId = null,}) {
  return _then(_AnimePlatformDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as PlatformDto,platformId: null == platformId ? _self.platformId : platformId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AnimePlatformDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlatformDtoCopyWith<$Res> get platform {
  
  return $PlatformDtoCopyWith<$Res>(_self.platform, (value) {
    return _then(_self.copyWith(platform: value));
  });
}
}

// dart format on
