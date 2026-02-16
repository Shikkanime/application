// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeTagDto {

 String get uuid; TagDto get tag; bool get isAdult; bool get isSpoiler;
/// Create a copy of AnimeTagDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeTagDtoCopyWith<AnimeTagDto> get copyWith => _$AnimeTagDtoCopyWithImpl<AnimeTagDto>(this as AnimeTagDto, _$identity);

  /// Serializes this AnimeTagDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeTagDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.isSpoiler, isSpoiler) || other.isSpoiler == isSpoiler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,tag,isAdult,isSpoiler);

@override
String toString() {
  return 'AnimeTagDto(uuid: $uuid, tag: $tag, isAdult: $isAdult, isSpoiler: $isSpoiler)';
}


}

/// @nodoc
abstract mixin class $AnimeTagDtoCopyWith<$Res>  {
  factory $AnimeTagDtoCopyWith(AnimeTagDto value, $Res Function(AnimeTagDto) _then) = _$AnimeTagDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, TagDto tag, bool isAdult, bool isSpoiler
});


$TagDtoCopyWith<$Res> get tag;

}
/// @nodoc
class _$AnimeTagDtoCopyWithImpl<$Res>
    implements $AnimeTagDtoCopyWith<$Res> {
  _$AnimeTagDtoCopyWithImpl(this._self, this._then);

  final AnimeTagDto _self;
  final $Res Function(AnimeTagDto) _then;

/// Create a copy of AnimeTagDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? tag = null,Object? isAdult = null,Object? isSpoiler = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as TagDto,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,isSpoiler: null == isSpoiler ? _self.isSpoiler : isSpoiler // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AnimeTagDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagDtoCopyWith<$Res> get tag {
  
  return $TagDtoCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnimeTagDto].
extension AnimeTagDtoPatterns on AnimeTagDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeTagDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeTagDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeTagDto value)  $default,){
final _that = this;
switch (_that) {
case _AnimeTagDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeTagDto value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeTagDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  TagDto tag,  bool isAdult,  bool isSpoiler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeTagDto() when $default != null:
return $default(_that.uuid,_that.tag,_that.isAdult,_that.isSpoiler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  TagDto tag,  bool isAdult,  bool isSpoiler)  $default,) {final _that = this;
switch (_that) {
case _AnimeTagDto():
return $default(_that.uuid,_that.tag,_that.isAdult,_that.isSpoiler);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  TagDto tag,  bool isAdult,  bool isSpoiler)?  $default,) {final _that = this;
switch (_that) {
case _AnimeTagDto() when $default != null:
return $default(_that.uuid,_that.tag,_that.isAdult,_that.isSpoiler);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeTagDto implements AnimeTagDto {
  const _AnimeTagDto({required this.uuid, required this.tag, required this.isAdult, required this.isSpoiler});
  factory _AnimeTagDto.fromJson(Map<String, dynamic> json) => _$AnimeTagDtoFromJson(json);

@override final  String uuid;
@override final  TagDto tag;
@override final  bool isAdult;
@override final  bool isSpoiler;

/// Create a copy of AnimeTagDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeTagDtoCopyWith<_AnimeTagDto> get copyWith => __$AnimeTagDtoCopyWithImpl<_AnimeTagDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeTagDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeTagDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.isAdult, isAdult) || other.isAdult == isAdult)&&(identical(other.isSpoiler, isSpoiler) || other.isSpoiler == isSpoiler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,tag,isAdult,isSpoiler);

@override
String toString() {
  return 'AnimeTagDto(uuid: $uuid, tag: $tag, isAdult: $isAdult, isSpoiler: $isSpoiler)';
}


}

/// @nodoc
abstract mixin class _$AnimeTagDtoCopyWith<$Res> implements $AnimeTagDtoCopyWith<$Res> {
  factory _$AnimeTagDtoCopyWith(_AnimeTagDto value, $Res Function(_AnimeTagDto) _then) = __$AnimeTagDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, TagDto tag, bool isAdult, bool isSpoiler
});


@override $TagDtoCopyWith<$Res> get tag;

}
/// @nodoc
class __$AnimeTagDtoCopyWithImpl<$Res>
    implements _$AnimeTagDtoCopyWith<$Res> {
  __$AnimeTagDtoCopyWithImpl(this._self, this._then);

  final _AnimeTagDto _self;
  final $Res Function(_AnimeTagDto) _then;

/// Create a copy of AnimeTagDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? tag = null,Object? isAdult = null,Object? isSpoiler = null,}) {
  return _then(_AnimeTagDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as TagDto,isAdult: null == isAdult ? _self.isAdult : isAdult // ignore: cast_nullable_to_non_nullable
as bool,isSpoiler: null == isSpoiler ? _self.isSpoiler : isSpoiler // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AnimeTagDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagDtoCopyWith<$Res> get tag {
  
  return $TagDtoCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

// dart format on
