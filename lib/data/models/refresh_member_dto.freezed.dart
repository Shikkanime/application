// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshMemberDto {

 PageableDto get missedAnimes; PageableDto get followedAnimes; PageableDto get followedEpisodes; int get totalDuration; int get totalUnseenDuration;
/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshMemberDtoCopyWith<RefreshMemberDto> get copyWith => _$RefreshMemberDtoCopyWithImpl<RefreshMemberDto>(this as RefreshMemberDto, _$identity);

  /// Serializes this RefreshMemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshMemberDto&&(identical(other.missedAnimes, missedAnimes) || other.missedAnimes == missedAnimes)&&(identical(other.followedAnimes, followedAnimes) || other.followedAnimes == followedAnimes)&&(identical(other.followedEpisodes, followedEpisodes) || other.followedEpisodes == followedEpisodes)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalUnseenDuration, totalUnseenDuration) || other.totalUnseenDuration == totalUnseenDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,missedAnimes,followedAnimes,followedEpisodes,totalDuration,totalUnseenDuration);

@override
String toString() {
  return 'RefreshMemberDto(missedAnimes: $missedAnimes, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration)';
}


}

/// @nodoc
abstract mixin class $RefreshMemberDtoCopyWith<$Res>  {
  factory $RefreshMemberDtoCopyWith(RefreshMemberDto value, $Res Function(RefreshMemberDto) _then) = _$RefreshMemberDtoCopyWithImpl;
@useResult
$Res call({
 PageableDto missedAnimes, PageableDto followedAnimes, PageableDto followedEpisodes, int totalDuration, int totalUnseenDuration
});


$PageableDtoCopyWith<$Res> get missedAnimes;$PageableDtoCopyWith<$Res> get followedAnimes;$PageableDtoCopyWith<$Res> get followedEpisodes;

}
/// @nodoc
class _$RefreshMemberDtoCopyWithImpl<$Res>
    implements $RefreshMemberDtoCopyWith<$Res> {
  _$RefreshMemberDtoCopyWithImpl(this._self, this._then);

  final RefreshMemberDto _self;
  final $Res Function(RefreshMemberDto) _then;

/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? missedAnimes = null,Object? followedAnimes = null,Object? followedEpisodes = null,Object? totalDuration = null,Object? totalUnseenDuration = null,}) {
  return _then(_self.copyWith(
missedAnimes: null == missedAnimes ? _self.missedAnimes : missedAnimes // ignore: cast_nullable_to_non_nullable
as PageableDto,followedAnimes: null == followedAnimes ? _self.followedAnimes : followedAnimes // ignore: cast_nullable_to_non_nullable
as PageableDto,followedEpisodes: null == followedEpisodes ? _self.followedEpisodes : followedEpisodes // ignore: cast_nullable_to_non_nullable
as PageableDto,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalUnseenDuration: null == totalUnseenDuration ? _self.totalUnseenDuration : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get missedAnimes {
  
  return $PageableDtoCopyWith<$Res>(_self.missedAnimes, (value) {
    return _then(_self.copyWith(missedAnimes: value));
  });
}/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get followedAnimes {
  
  return $PageableDtoCopyWith<$Res>(_self.followedAnimes, (value) {
    return _then(_self.copyWith(followedAnimes: value));
  });
}/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get followedEpisodes {
  
  return $PageableDtoCopyWith<$Res>(_self.followedEpisodes, (value) {
    return _then(_self.copyWith(followedEpisodes: value));
  });
}
}


/// Adds pattern-matching-related methods to [RefreshMemberDto].
extension RefreshMemberDtoPatterns on RefreshMemberDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshMemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshMemberDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshMemberDto value)  $default,){
final _that = this;
switch (_that) {
case _RefreshMemberDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshMemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshMemberDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageableDto missedAnimes,  PageableDto followedAnimes,  PageableDto followedEpisodes,  int totalDuration,  int totalUnseenDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshMemberDto() when $default != null:
return $default(_that.missedAnimes,_that.followedAnimes,_that.followedEpisodes,_that.totalDuration,_that.totalUnseenDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageableDto missedAnimes,  PageableDto followedAnimes,  PageableDto followedEpisodes,  int totalDuration,  int totalUnseenDuration)  $default,) {final _that = this;
switch (_that) {
case _RefreshMemberDto():
return $default(_that.missedAnimes,_that.followedAnimes,_that.followedEpisodes,_that.totalDuration,_that.totalUnseenDuration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageableDto missedAnimes,  PageableDto followedAnimes,  PageableDto followedEpisodes,  int totalDuration,  int totalUnseenDuration)?  $default,) {final _that = this;
switch (_that) {
case _RefreshMemberDto() when $default != null:
return $default(_that.missedAnimes,_that.followedAnimes,_that.followedEpisodes,_that.totalDuration,_that.totalUnseenDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshMemberDto implements RefreshMemberDto {
  const _RefreshMemberDto({required this.missedAnimes, required this.followedAnimes, required this.followedEpisodes, required this.totalDuration, required this.totalUnseenDuration});
  factory _RefreshMemberDto.fromJson(Map<String, dynamic> json) => _$RefreshMemberDtoFromJson(json);

@override final  PageableDto missedAnimes;
@override final  PageableDto followedAnimes;
@override final  PageableDto followedEpisodes;
@override final  int totalDuration;
@override final  int totalUnseenDuration;

/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshMemberDtoCopyWith<_RefreshMemberDto> get copyWith => __$RefreshMemberDtoCopyWithImpl<_RefreshMemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshMemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshMemberDto&&(identical(other.missedAnimes, missedAnimes) || other.missedAnimes == missedAnimes)&&(identical(other.followedAnimes, followedAnimes) || other.followedAnimes == followedAnimes)&&(identical(other.followedEpisodes, followedEpisodes) || other.followedEpisodes == followedEpisodes)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.totalUnseenDuration, totalUnseenDuration) || other.totalUnseenDuration == totalUnseenDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,missedAnimes,followedAnimes,followedEpisodes,totalDuration,totalUnseenDuration);

@override
String toString() {
  return 'RefreshMemberDto(missedAnimes: $missedAnimes, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration)';
}


}

/// @nodoc
abstract mixin class _$RefreshMemberDtoCopyWith<$Res> implements $RefreshMemberDtoCopyWith<$Res> {
  factory _$RefreshMemberDtoCopyWith(_RefreshMemberDto value, $Res Function(_RefreshMemberDto) _then) = __$RefreshMemberDtoCopyWithImpl;
@override @useResult
$Res call({
 PageableDto missedAnimes, PageableDto followedAnimes, PageableDto followedEpisodes, int totalDuration, int totalUnseenDuration
});


@override $PageableDtoCopyWith<$Res> get missedAnimes;@override $PageableDtoCopyWith<$Res> get followedAnimes;@override $PageableDtoCopyWith<$Res> get followedEpisodes;

}
/// @nodoc
class __$RefreshMemberDtoCopyWithImpl<$Res>
    implements _$RefreshMemberDtoCopyWith<$Res> {
  __$RefreshMemberDtoCopyWithImpl(this._self, this._then);

  final _RefreshMemberDto _self;
  final $Res Function(_RefreshMemberDto) _then;

/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? missedAnimes = null,Object? followedAnimes = null,Object? followedEpisodes = null,Object? totalDuration = null,Object? totalUnseenDuration = null,}) {
  return _then(_RefreshMemberDto(
missedAnimes: null == missedAnimes ? _self.missedAnimes : missedAnimes // ignore: cast_nullable_to_non_nullable
as PageableDto,followedAnimes: null == followedAnimes ? _self.followedAnimes : followedAnimes // ignore: cast_nullable_to_non_nullable
as PageableDto,followedEpisodes: null == followedEpisodes ? _self.followedEpisodes : followedEpisodes // ignore: cast_nullable_to_non_nullable
as PageableDto,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as int,totalUnseenDuration: null == totalUnseenDuration ? _self.totalUnseenDuration : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get missedAnimes {
  
  return $PageableDtoCopyWith<$Res>(_self.missedAnimes, (value) {
    return _then(_self.copyWith(missedAnimes: value));
  });
}/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get followedAnimes {
  
  return $PageableDtoCopyWith<$Res>(_self.followedAnimes, (value) {
    return _then(_self.copyWith(followedAnimes: value));
  });
}/// Create a copy of RefreshMemberDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get followedEpisodes {
  
  return $PageableDtoCopyWith<$Res>(_self.followedEpisodes, (value) {
    return _then(_self.copyWith(followedEpisodes: value));
  });
}
}

// dart format on
