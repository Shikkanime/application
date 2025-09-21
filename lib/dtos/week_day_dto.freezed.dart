// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekDayDto {

 String get dayOfWeek; List<WeekDayReleaseDto> get releases;
/// Create a copy of WeekDayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekDayDtoCopyWith<WeekDayDto> get copyWith => _$WeekDayDtoCopyWithImpl<WeekDayDto>(this as WeekDayDto, _$identity);

  /// Serializes this WeekDayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekDayDto&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&const DeepCollectionEquality().equals(other.releases, releases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayOfWeek,const DeepCollectionEquality().hash(releases));

@override
String toString() {
  return 'WeekDayDto(dayOfWeek: $dayOfWeek, releases: $releases)';
}


}

/// @nodoc
abstract mixin class $WeekDayDtoCopyWith<$Res>  {
  factory $WeekDayDtoCopyWith(WeekDayDto value, $Res Function(WeekDayDto) _then) = _$WeekDayDtoCopyWithImpl;
@useResult
$Res call({
 String dayOfWeek, List<WeekDayReleaseDto> releases
});




}
/// @nodoc
class _$WeekDayDtoCopyWithImpl<$Res>
    implements $WeekDayDtoCopyWith<$Res> {
  _$WeekDayDtoCopyWithImpl(this._self, this._then);

  final WeekDayDto _self;
  final $Res Function(WeekDayDto) _then;

/// Create a copy of WeekDayDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayOfWeek = null,Object? releases = null,}) {
  return _then(_self.copyWith(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,releases: null == releases ? _self.releases : releases // ignore: cast_nullable_to_non_nullable
as List<WeekDayReleaseDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeekDayDto].
extension WeekDayDtoPatterns on WeekDayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekDayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekDayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekDayDto value)  $default,){
final _that = this;
switch (_that) {
case _WeekDayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekDayDto value)?  $default,){
final _that = this;
switch (_that) {
case _WeekDayDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dayOfWeek,  List<WeekDayReleaseDto> releases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekDayDto() when $default != null:
return $default(_that.dayOfWeek,_that.releases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dayOfWeek,  List<WeekDayReleaseDto> releases)  $default,) {final _that = this;
switch (_that) {
case _WeekDayDto():
return $default(_that.dayOfWeek,_that.releases);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dayOfWeek,  List<WeekDayReleaseDto> releases)?  $default,) {final _that = this;
switch (_that) {
case _WeekDayDto() when $default != null:
return $default(_that.dayOfWeek,_that.releases);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeekDayDto implements WeekDayDto {
  const _WeekDayDto({required this.dayOfWeek, required final  List<WeekDayReleaseDto> releases}): _releases = releases;
  factory _WeekDayDto.fromJson(Map<String, dynamic> json) => _$WeekDayDtoFromJson(json);

@override final  String dayOfWeek;
 final  List<WeekDayReleaseDto> _releases;
@override List<WeekDayReleaseDto> get releases {
  if (_releases is EqualUnmodifiableListView) return _releases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_releases);
}


/// Create a copy of WeekDayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekDayDtoCopyWith<_WeekDayDto> get copyWith => __$WeekDayDtoCopyWithImpl<_WeekDayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekDayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekDayDto&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&const DeepCollectionEquality().equals(other._releases, _releases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dayOfWeek,const DeepCollectionEquality().hash(_releases));

@override
String toString() {
  return 'WeekDayDto(dayOfWeek: $dayOfWeek, releases: $releases)';
}


}

/// @nodoc
abstract mixin class _$WeekDayDtoCopyWith<$Res> implements $WeekDayDtoCopyWith<$Res> {
  factory _$WeekDayDtoCopyWith(_WeekDayDto value, $Res Function(_WeekDayDto) _then) = __$WeekDayDtoCopyWithImpl;
@override @useResult
$Res call({
 String dayOfWeek, List<WeekDayReleaseDto> releases
});




}
/// @nodoc
class __$WeekDayDtoCopyWithImpl<$Res>
    implements _$WeekDayDtoCopyWith<$Res> {
  __$WeekDayDtoCopyWithImpl(this._self, this._then);

  final _WeekDayDto _self;
  final $Res Function(_WeekDayDto) _then;

/// Create a copy of WeekDayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayOfWeek = null,Object? releases = null,}) {
  return _then(_WeekDayDto(
dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,releases: null == releases ? _self._releases : releases // ignore: cast_nullable_to_non_nullable
as List<WeekDayReleaseDto>,
  ));
}


}

// dart format on
