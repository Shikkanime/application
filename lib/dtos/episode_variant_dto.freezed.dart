// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_variant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeVariantDto {

 String get uuid; String get url;
/// Create a copy of EpisodeVariantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeVariantDtoCopyWith<EpisodeVariantDto> get copyWith => _$EpisodeVariantDtoCopyWithImpl<EpisodeVariantDto>(this as EpisodeVariantDto, _$identity);

  /// Serializes this EpisodeVariantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeVariantDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,url);

@override
String toString() {
  return 'EpisodeVariantDto(uuid: $uuid, url: $url)';
}


}

/// @nodoc
abstract mixin class $EpisodeVariantDtoCopyWith<$Res>  {
  factory $EpisodeVariantDtoCopyWith(EpisodeVariantDto value, $Res Function(EpisodeVariantDto) _then) = _$EpisodeVariantDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, String url
});




}
/// @nodoc
class _$EpisodeVariantDtoCopyWithImpl<$Res>
    implements $EpisodeVariantDtoCopyWith<$Res> {
  _$EpisodeVariantDtoCopyWithImpl(this._self, this._then);

  final EpisodeVariantDto _self;
  final $Res Function(EpisodeVariantDto) _then;

/// Create a copy of EpisodeVariantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? url = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeVariantDto].
extension EpisodeVariantDtoPatterns on EpisodeVariantDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeVariantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeVariantDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeVariantDto value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeVariantDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeVariantDto value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeVariantDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeVariantDto() when $default != null:
return $default(_that.uuid,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  String url)  $default,) {final _that = this;
switch (_that) {
case _EpisodeVariantDto():
return $default(_that.uuid,_that.url);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  String url)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeVariantDto() when $default != null:
return $default(_that.uuid,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodeVariantDto implements EpisodeVariantDto {
  const _EpisodeVariantDto({required this.uuid, required this.url});
  factory _EpisodeVariantDto.fromJson(Map<String, dynamic> json) => _$EpisodeVariantDtoFromJson(json);

@override final  String uuid;
@override final  String url;

/// Create a copy of EpisodeVariantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeVariantDtoCopyWith<_EpisodeVariantDto> get copyWith => __$EpisodeVariantDtoCopyWithImpl<_EpisodeVariantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeVariantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeVariantDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,url);

@override
String toString() {
  return 'EpisodeVariantDto(uuid: $uuid, url: $url)';
}


}

/// @nodoc
abstract mixin class _$EpisodeVariantDtoCopyWith<$Res> implements $EpisodeVariantDtoCopyWith<$Res> {
  factory _$EpisodeVariantDtoCopyWith(_EpisodeVariantDto value, $Res Function(_EpisodeVariantDto) _then) = __$EpisodeVariantDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String url
});




}
/// @nodoc
class __$EpisodeVariantDtoCopyWithImpl<$Res>
    implements _$EpisodeVariantDtoCopyWith<$Res> {
  __$EpisodeVariantDtoCopyWithImpl(this._self, this._then);

  final _EpisodeVariantDto _self;
  final $Res Function(_EpisodeVariantDto) _then;

/// Create a copy of EpisodeVariantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? url = null,}) {
  return _then(_EpisodeVariantDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
