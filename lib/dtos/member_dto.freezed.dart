// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get uuid; String get token; String get creationDateTime; String? get email; List<String> get followedAnimes; List<String> get followedEpisodes; int get totalDuration; int get totalUnseenDuration; String? get attachmentLastUpdateDateTime;
/// Create a copy of MemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberDtoCopyWith<MemberDto> get copyWith => _$MemberDtoCopyWithImpl<MemberDto>(this as MemberDto, _$identity);

  /// Serializes this MemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.token, token) || other.token == token)&&(identical(other.creationDateTime, creationDateTime) || other.creationDateTime == creationDateTime)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.followedAnimes, followedAnimes)&&const DeepCollectionEquality().equals(other.followedEpisodes, followedEpisodes)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalUnseenDuration, totalUnseenDuration) || other.totalUnseenDuration == totalUnseenDuration)&&(identical(other.attachmentLastUpdateDateTime, attachmentLastUpdateDateTime) || other.attachmentLastUpdateDateTime == attachmentLastUpdateDateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,token,creationDateTime,email,const DeepCollectionEquality().hash(followedAnimes),const DeepCollectionEquality().hash(followedEpisodes),totalDuration,totalUnseenDuration,attachmentLastUpdateDateTime);

@override
String toString() {
  return 'MemberDto(uuid: $uuid, token: $token, creationDateTime: $creationDateTime, email: $email, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration, attachmentLastUpdateDateTime: $attachmentLastUpdateDateTime)';
}


}

/// @nodoc
abstract mixin class $MemberDtoCopyWith<$Res>  {
  factory $MemberDtoCopyWith(MemberDto value, $Res Function(MemberDto) _then) = _$MemberDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, String token, String creationDateTime, String? email, List<String> followedAnimes, List<String> followedEpisodes, int totalDuration, int totalUnseenDuration, String? attachmentLastUpdateDateTime
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
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? token = null,Object? creationDateTime = null,Object? email = freezed,Object? followedAnimes = null,Object? followedEpisodes = null,Object? totalDuration = null,Object? totalUnseenDuration = null,Object? attachmentLastUpdateDateTime = freezed,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,creationDateTime: null == creationDateTime ? _self.creationDateTime : creationDateTime // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followedAnimes: null == followedAnimes ? _self.followedAnimes : followedAnimes // ignore: cast_nullable_to_non_nullable
as List<String>,followedEpisodes: null == followedEpisodes ? _self.followedEpisodes : followedEpisodes // ignore: cast_nullable_to_non_nullable
as List<String>,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalUnseenDuration: null == totalUnseenDuration ? _self.totalUnseenDuration : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
as int,attachmentLastUpdateDateTime: freezed == attachmentLastUpdateDateTime ? _self.attachmentLastUpdateDateTime : attachmentLastUpdateDateTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberDto].
extension MemberDtoPatterns on MemberDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberDto value)  $default,){
final _that = this;
switch (_that) {
case _MemberDto():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  String token,  String creationDateTime,  String? email,  List<String> followedAnimes,  List<String> followedEpisodes,  int totalDuration,  int totalUnseenDuration,  String? attachmentLastUpdateDateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that.uuid,_that.token,_that.creationDateTime,_that.email,_that.followedAnimes,_that.followedEpisodes,_that.totalDuration,_that.totalUnseenDuration,_that.attachmentLastUpdateDateTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  String token,  String creationDateTime,  String? email,  List<String> followedAnimes,  List<String> followedEpisodes,  int totalDuration,  int totalUnseenDuration,  String? attachmentLastUpdateDateTime)  $default,) {final _that = this;
switch (_that) {
case _MemberDto():
return $default(_that.uuid,_that.token,_that.creationDateTime,_that.email,_that.followedAnimes,_that.followedEpisodes,_that.totalDuration,_that.totalUnseenDuration,_that.attachmentLastUpdateDateTime);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  String token,  String creationDateTime,  String? email,  List<String> followedAnimes,  List<String> followedEpisodes,  int totalDuration,  int totalUnseenDuration,  String? attachmentLastUpdateDateTime)?  $default,) {final _that = this;
switch (_that) {
case _MemberDto() when $default != null:
return $default(_that.uuid,_that.token,_that.creationDateTime,_that.email,_that.followedAnimes,_that.followedEpisodes,_that.totalDuration,_that.totalUnseenDuration,_that.attachmentLastUpdateDateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberDto implements MemberDto {
  const _MemberDto({required this.uuid, required this.token, required this.creationDateTime, required this.email, required this.followedAnimes, required this.followedEpisodes, required this.totalDuration, required this.totalUnseenDuration, required this.attachmentLastUpdateDateTime});
  factory _MemberDto.fromJson(Map<String, dynamic> json) => _$MemberDtoFromJson(json);

@override final  String uuid;
@override final  String token;
@override final  String creationDateTime;
@override final  String? email;
@override final  List<String> followedAnimes;
@override final  List<String> followedEpisodes;
@override final  int totalDuration;
@override final  int totalUnseenDuration;
@override final  String? attachmentLastUpdateDateTime;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.token, token) || other.token == token)&&(identical(other.creationDateTime, creationDateTime) || other.creationDateTime == creationDateTime)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.followedAnimes, followedAnimes)&&const DeepCollectionEquality().equals(other.followedEpisodes, followedEpisodes)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalUnseenDuration, totalUnseenDuration) || other.totalUnseenDuration == totalUnseenDuration)&&(identical(other.attachmentLastUpdateDateTime, attachmentLastUpdateDateTime) || other.attachmentLastUpdateDateTime == attachmentLastUpdateDateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,token,creationDateTime,email,const DeepCollectionEquality().hash(followedAnimes),const DeepCollectionEquality().hash(followedEpisodes),totalDuration,totalUnseenDuration,attachmentLastUpdateDateTime);

@override
String toString() {
  return 'MemberDto(uuid: $uuid, token: $token, creationDateTime: $creationDateTime, email: $email, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration, attachmentLastUpdateDateTime: $attachmentLastUpdateDateTime)';
}


}

/// @nodoc
abstract mixin class _$MemberDtoCopyWith<$Res> implements $MemberDtoCopyWith<$Res> {
  factory _$MemberDtoCopyWith(_MemberDto value, $Res Function(_MemberDto) _then) = __$MemberDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String token, String creationDateTime, String? email, List<String> followedAnimes, List<String> followedEpisodes, int totalDuration, int totalUnseenDuration, String? attachmentLastUpdateDateTime
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
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? token = null,Object? creationDateTime = null,Object? email = freezed,Object? followedAnimes = null,Object? followedEpisodes = null,Object? totalDuration = null,Object? totalUnseenDuration = null,Object? attachmentLastUpdateDateTime = freezed,}) {
  return _then(_MemberDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,creationDateTime: null == creationDateTime ? _self.creationDateTime : creationDateTime // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,followedAnimes: null == followedAnimes ? _self.followedAnimes : followedAnimes // ignore: cast_nullable_to_non_nullable
as List<String>,followedEpisodes: null == followedEpisodes ? _self.followedEpisodes : followedEpisodes // ignore: cast_nullable_to_non_nullable
as List<String>,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalUnseenDuration: null == totalUnseenDuration ? _self.totalUnseenDuration : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
as int,attachmentLastUpdateDateTime: freezed == attachmentLastUpdateDateTime ? _self.attachmentLastUpdateDateTime : attachmentLastUpdateDateTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
