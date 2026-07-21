// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simulcast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SimulcastDto {

 String get uuid; String get season; int get year;
/// Create a copy of SimulcastDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimulcastDtoCopyWith<SimulcastDto> get copyWith => _$SimulcastDtoCopyWithImpl<SimulcastDto>(this as SimulcastDto, _$identity);

  /// Serializes this SimulcastDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimulcastDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.season, season) || other.season == season)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,season,year);

@override
String toString() {
  return 'SimulcastDto(uuid: $uuid, season: $season, year: $year)';
}


}

/// @nodoc
abstract mixin class $SimulcastDtoCopyWith<$Res>  {
  factory $SimulcastDtoCopyWith(SimulcastDto value, $Res Function(SimulcastDto) _then) = _$SimulcastDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, String season, int year
});




}
/// @nodoc
class _$SimulcastDtoCopyWithImpl<$Res>
    implements $SimulcastDtoCopyWith<$Res> {
  _$SimulcastDtoCopyWithImpl(this._self, this._then);

  final SimulcastDto _self;
  final $Res Function(SimulcastDto) _then;

/// Create a copy of SimulcastDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? season = null,Object? year = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SimulcastDto].
extension SimulcastDtoPatterns on SimulcastDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimulcastDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimulcastDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimulcastDto value)  $default,){
final _that = this;
switch (_that) {
case _SimulcastDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimulcastDto value)?  $default,){
final _that = this;
switch (_that) {
case _SimulcastDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  String season,  int year)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimulcastDto() when $default != null:
return $default(_that.uuid,_that.season,_that.year);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  String season,  int year)  $default,) {final _that = this;
switch (_that) {
case _SimulcastDto():
return $default(_that.uuid,_that.season,_that.year);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  String season,  int year)?  $default,) {final _that = this;
switch (_that) {
case _SimulcastDto() when $default != null:
return $default(_that.uuid,_that.season,_that.year);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimulcastDto implements SimulcastDto {
  const _SimulcastDto({required this.uuid, required this.season, required this.year});
  factory _SimulcastDto.fromJson(Map<String, dynamic> json) => _$SimulcastDtoFromJson(json);

@override final  String uuid;
@override final  String season;
@override final  int year;

/// Create a copy of SimulcastDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimulcastDtoCopyWith<_SimulcastDto> get copyWith => __$SimulcastDtoCopyWithImpl<_SimulcastDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimulcastDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulcastDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.season, season) || other.season == season)&&(identical(other.year, year) || other.year == year));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,season,year);

@override
String toString() {
  return 'SimulcastDto(uuid: $uuid, season: $season, year: $year)';
}


}

/// @nodoc
abstract mixin class _$SimulcastDtoCopyWith<$Res> implements $SimulcastDtoCopyWith<$Res> {
  factory _$SimulcastDtoCopyWith(_SimulcastDto value, $Res Function(_SimulcastDto) _then) = __$SimulcastDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String season, int year
});




}
/// @nodoc
class __$SimulcastDtoCopyWithImpl<$Res>
    implements _$SimulcastDtoCopyWith<$Res> {
  __$SimulcastDtoCopyWithImpl(this._self, this._then);

  final _SimulcastDto _self;
  final $Res Function(_SimulcastDto) _then;

/// Create a copy of SimulcastDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? season = null,Object? year = null,}) {
  return _then(_SimulcastDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
