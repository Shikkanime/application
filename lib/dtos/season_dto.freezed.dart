// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonDto {

 int get number;
/// Create a copy of SeasonDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonDtoCopyWith<SeasonDto> get copyWith => _$SeasonDtoCopyWithImpl<SeasonDto>(this as SeasonDto, _$identity);

  /// Serializes this SeasonDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonDto&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'SeasonDto(number: $number)';
}


}

/// @nodoc
abstract mixin class $SeasonDtoCopyWith<$Res>  {
  factory $SeasonDtoCopyWith(SeasonDto value, $Res Function(SeasonDto) _then) = _$SeasonDtoCopyWithImpl;
@useResult
$Res call({
 int number
});




}
/// @nodoc
class _$SeasonDtoCopyWithImpl<$Res>
    implements $SeasonDtoCopyWith<$Res> {
  _$SeasonDtoCopyWithImpl(this._self, this._then);

  final SeasonDto _self;
  final $Res Function(SeasonDto) _then;

/// Create a copy of SeasonDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonDto].
extension SeasonDtoPatterns on SeasonDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonDto value)  $default,){
final _that = this;
switch (_that) {
case _SeasonDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonDto value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonDto() when $default != null:
return $default(_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number)  $default,) {final _that = this;
switch (_that) {
case _SeasonDto():
return $default(_that.number);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number)?  $default,) {final _that = this;
switch (_that) {
case _SeasonDto() when $default != null:
return $default(_that.number);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeasonDto implements SeasonDto {
  const _SeasonDto({required this.number});
  factory _SeasonDto.fromJson(Map<String, dynamic> json) => _$SeasonDtoFromJson(json);

@override final  int number;

/// Create a copy of SeasonDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonDtoCopyWith<_SeasonDto> get copyWith => __$SeasonDtoCopyWithImpl<_SeasonDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonDto&&(identical(other.number, number) || other.number == number));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'SeasonDto(number: $number)';
}


}

/// @nodoc
abstract mixin class _$SeasonDtoCopyWith<$Res> implements $SeasonDtoCopyWith<$Res> {
  factory _$SeasonDtoCopyWith(_SeasonDto value, $Res Function(_SeasonDto) _then) = __$SeasonDtoCopyWithImpl;
@override @useResult
$Res call({
 int number
});




}
/// @nodoc
class __$SeasonDtoCopyWithImpl<$Res>
    implements _$SeasonDtoCopyWith<$Res> {
  __$SeasonDtoCopyWithImpl(this._self, this._then);

  final _SeasonDto _self;
  final $Res Function(_SeasonDto) _then;

/// Create a copy of SeasonDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,}) {
  return _then(_SeasonDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
