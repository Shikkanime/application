// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenreDto {

 String get uuid; String get name;
/// Create a copy of GenreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreDtoCopyWith<GenreDto> get copyWith => _$GenreDtoCopyWithImpl<GenreDto>(this as GenreDto, _$identity);

  /// Serializes this GenreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,name);

@override
String toString() {
  return 'GenreDto(uuid: $uuid, name: $name)';
}


}

/// @nodoc
abstract mixin class $GenreDtoCopyWith<$Res>  {
  factory $GenreDtoCopyWith(GenreDto value, $Res Function(GenreDto) _then) = _$GenreDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, String name
});




}
/// @nodoc
class _$GenreDtoCopyWithImpl<$Res>
    implements $GenreDtoCopyWith<$Res> {
  _$GenreDtoCopyWithImpl(this._self, this._then);

  final GenreDto _self;
  final $Res Function(GenreDto) _then;

/// Create a copy of GenreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? name = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenreDto].
extension GenreDtoPatterns on GenreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenreDto value)  $default,){
final _that = this;
switch (_that) {
case _GenreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenreDto value)?  $default,){
final _that = this;
switch (_that) {
case _GenreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenreDto() when $default != null:
return $default(_that.uuid,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  String name)  $default,) {final _that = this;
switch (_that) {
case _GenreDto():
return $default(_that.uuid,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  String name)?  $default,) {final _that = this;
switch (_that) {
case _GenreDto() when $default != null:
return $default(_that.uuid,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenreDto implements GenreDto {
  const _GenreDto({required this.uuid, required this.name});
  factory _GenreDto.fromJson(Map<String, dynamic> json) => _$GenreDtoFromJson(json);

@override final  String uuid;
@override final  String name;

/// Create a copy of GenreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreDtoCopyWith<_GenreDto> get copyWith => __$GenreDtoCopyWithImpl<_GenreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenreDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,name);

@override
String toString() {
  return 'GenreDto(uuid: $uuid, name: $name)';
}


}

/// @nodoc
abstract mixin class _$GenreDtoCopyWith<$Res> implements $GenreDtoCopyWith<$Res> {
  factory _$GenreDtoCopyWith(_GenreDto value, $Res Function(_GenreDto) _then) = __$GenreDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String name
});




}
/// @nodoc
class __$GenreDtoCopyWithImpl<$Res>
    implements _$GenreDtoCopyWith<$Res> {
  __$GenreDtoCopyWithImpl(this._self, this._then);

  final _GenreDto _self;
  final $Res Function(_GenreDto) _then;

/// Create a copy of GenreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? name = null,}) {
  return _then(_GenreDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
