// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberDto {

 String get uuid; String get token; String get creationDateTime; String? get email; List<String> get followedAnimes; List<String> get followedEpisodes; int get totalDuration; int get totalUnseenDuration; bool get hasProfilePicture;
/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberDtoCopyWith<MemberDto> get copyWith => _$MemberDtoCopyWithImpl<MemberDto>(this as MemberDto, _$identity);

  /// Serializes this MemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.token, token) || other.token == token)&&(identical(other.creationDateTime, creationDateTime) || other.creationDateTime == creationDateTime)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.followedAnimes, followedAnimes)&&const DeepCollectionEquality().equals(other.followedEpisodes, followedEpisodes)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalUnseenDuration, totalUnseenDuration) || other.totalUnseenDuration == totalUnseenDuration)&&(identical(other.hasProfilePicture, hasProfilePicture) || other.hasProfilePicture == hasProfilePicture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,token,creationDateTime,email,const DeepCollectionEquality().hash(followedAnimes),const DeepCollectionEquality().hash(followedEpisodes),totalDuration,totalUnseenDuration,hasProfilePicture);

@override
String toString() {
  return 'MemberDto(uuid: $uuid, token: $token, creationDateTime: $creationDateTime, email: $email, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration, hasProfilePicture: $hasProfilePicture)';
}


}

/// @nodoc
abstract mixin class $MemberDtoCopyWith<$Res>  {
  factory $MemberDtoCopyWith(MemberDto value, $Res Function(MemberDto) _then) = _$MemberDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, String token, String creationDateTime, String? email, List<String> followedAnimes, List<String> followedEpisodes, int totalDuration, int totalUnseenDuration, bool hasProfilePicture
});




}
/// @nodoc
class _$MemberDtoCopyWithImpl<$Res>
    implements $MemberDtoCopyWith<$Res> {
  _$MemberDtoCopyWithImpl(this._self, this._then);

  final MemberDto _self;
  final $Res Function(MemberDto) _then;

/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? token = null,Object? creationDateTime = null,Object? email = freezed,Object? followedAnimes = null,Object? followedEpisodes = null,Object? totalDuration = null,Object? totalUnseenDuration = null,Object? hasProfilePicture = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,creationDateTime: null == creationDateTime ? _self.creationDateTime : creationDateTime // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followedAnimes: null == followedAnimes ? _self.followedAnimes : followedAnimes // ignore: cast_nullable_to_non_nullable
as List<String>,followedEpisodes: null == followedEpisodes ? _self.followedEpisodes : followedEpisodes // ignore: cast_nullable_to_non_nullable
as List<String>,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalUnseenDuration: null == totalUnseenDuration ? _self.totalUnseenDuration : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
as int,hasProfilePicture: null == hasProfilePicture ? _self.hasProfilePicture : hasProfilePicture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MemberDto implements MemberDto {
  const _MemberDto({required this.uuid, required this.token, required this.creationDateTime, required this.email, required this.followedAnimes, required this.followedEpisodes, required this.totalDuration, required this.totalUnseenDuration, required this.hasProfilePicture});
  factory _MemberDto.fromJson(Map<String, dynamic> json) => _$MemberDtoFromJson(json);

@override final  String uuid;
@override final  String token;
@override final  String creationDateTime;
@override final  String? email;
@override final  List<String> followedAnimes;
@override final  List<String> followedEpisodes;
@override final  int totalDuration;
@override final  int totalUnseenDuration;
@override final  bool hasProfilePicture;

/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberDtoCopyWith<_MemberDto> get copyWith => __$MemberDtoCopyWithImpl<_MemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.token, token) || other.token == token)&&(identical(other.creationDateTime, creationDateTime) || other.creationDateTime == creationDateTime)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.followedAnimes, followedAnimes)&&const DeepCollectionEquality().equals(other.followedEpisodes, followedEpisodes)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalUnseenDuration, totalUnseenDuration) || other.totalUnseenDuration == totalUnseenDuration)&&(identical(other.hasProfilePicture, hasProfilePicture) || other.hasProfilePicture == hasProfilePicture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,token,creationDateTime,email,const DeepCollectionEquality().hash(followedAnimes),const DeepCollectionEquality().hash(followedEpisodes),totalDuration,totalUnseenDuration,hasProfilePicture);

@override
String toString() {
  return 'MemberDto(uuid: $uuid, token: $token, creationDateTime: $creationDateTime, email: $email, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration, hasProfilePicture: $hasProfilePicture)';
}


}

/// @nodoc
abstract mixin class _$MemberDtoCopyWith<$Res> implements $MemberDtoCopyWith<$Res> {
  factory _$MemberDtoCopyWith(_MemberDto value, $Res Function(_MemberDto) _then) = __$MemberDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String token, String creationDateTime, String? email, List<String> followedAnimes, List<String> followedEpisodes, int totalDuration, int totalUnseenDuration, bool hasProfilePicture
});




}
/// @nodoc
class __$MemberDtoCopyWithImpl<$Res>
    implements _$MemberDtoCopyWith<$Res> {
  __$MemberDtoCopyWithImpl(this._self, this._then);

  final _MemberDto _self;
  final $Res Function(_MemberDto) _then;

/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? token = null,Object? creationDateTime = null,Object? email = freezed,Object? followedAnimes = null,Object? followedEpisodes = null,Object? totalDuration = null,Object? totalUnseenDuration = null,Object? hasProfilePicture = null,}) {
  return _then(_MemberDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,creationDateTime: null == creationDateTime ? _self.creationDateTime : creationDateTime // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followedAnimes: null == followedAnimes ? _self.followedAnimes : followedAnimes // ignore: cast_nullable_to_non_nullable
as List<String>,followedEpisodes: null == followedEpisodes ? _self.followedEpisodes : followedEpisodes // ignore: cast_nullable_to_non_nullable
as List<String>,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalUnseenDuration: null == totalUnseenDuration ? _self.totalUnseenDuration : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
as int,hasProfilePicture: null == hasProfilePicture ? _self.hasProfilePicture : hasProfilePicture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
