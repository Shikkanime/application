// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'missed_anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MissedAnimeDto {

 AnimeDto get anime; int get episodeMissed;
/// Create a copy of MissedAnimeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MissedAnimeDtoCopyWith<MissedAnimeDto> get copyWith => _$MissedAnimeDtoCopyWithImpl<MissedAnimeDto>(this as MissedAnimeDto, _$identity);

  /// Serializes this MissedAnimeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissedAnimeDto&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.episodeMissed, episodeMissed) || other.episodeMissed == episodeMissed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,episodeMissed);

@override
String toString() {
  return 'MissedAnimeDto(anime: $anime, episodeMissed: $episodeMissed)';
}


}

/// @nodoc
abstract mixin class $MissedAnimeDtoCopyWith<$Res>  {
  factory $MissedAnimeDtoCopyWith(MissedAnimeDto value, $Res Function(MissedAnimeDto) _then) = _$MissedAnimeDtoCopyWithImpl;
@useResult
$Res call({
 AnimeDto anime, int episodeMissed
});


$AnimeDtoCopyWith<$Res> get anime;

}
/// @nodoc
class _$MissedAnimeDtoCopyWithImpl<$Res>
    implements $MissedAnimeDtoCopyWith<$Res> {
  _$MissedAnimeDtoCopyWithImpl(this._self, this._then);

  final MissedAnimeDto _self;
  final $Res Function(MissedAnimeDto) _then;

/// Create a copy of MissedAnimeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? episodeMissed = null,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,episodeMissed: null == episodeMissed ? _self.episodeMissed : episodeMissed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MissedAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeDtoCopyWith<$Res> get anime {
  
  return $AnimeDtoCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}


/// Adds pattern-matching-related methods to [MissedAnimeDto].
extension MissedAnimeDtoPatterns on MissedAnimeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MissedAnimeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MissedAnimeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MissedAnimeDto value)  $default,){
final _that = this;
switch (_that) {
case _MissedAnimeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MissedAnimeDto value)?  $default,){
final _that = this;
switch (_that) {
case _MissedAnimeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnimeDto anime,  int episodeMissed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MissedAnimeDto() when $default != null:
return $default(_that.anime,_that.episodeMissed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnimeDto anime,  int episodeMissed)  $default,) {final _that = this;
switch (_that) {
case _MissedAnimeDto():
return $default(_that.anime,_that.episodeMissed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnimeDto anime,  int episodeMissed)?  $default,) {final _that = this;
switch (_that) {
case _MissedAnimeDto() when $default != null:
return $default(_that.anime,_that.episodeMissed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MissedAnimeDto implements MissedAnimeDto {
  const _MissedAnimeDto({required this.anime, required this.episodeMissed});
  factory _MissedAnimeDto.fromJson(Map<String, dynamic> json) => _$MissedAnimeDtoFromJson(json);

@override final  AnimeDto anime;
@override final  int episodeMissed;

/// Create a copy of MissedAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MissedAnimeDtoCopyWith<_MissedAnimeDto> get copyWith => __$MissedAnimeDtoCopyWithImpl<_MissedAnimeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MissedAnimeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MissedAnimeDto&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.episodeMissed, episodeMissed) || other.episodeMissed == episodeMissed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,episodeMissed);

@override
String toString() {
  return 'MissedAnimeDto(anime: $anime, episodeMissed: $episodeMissed)';
}


}

/// @nodoc
abstract mixin class _$MissedAnimeDtoCopyWith<$Res> implements $MissedAnimeDtoCopyWith<$Res> {
  factory _$MissedAnimeDtoCopyWith(_MissedAnimeDto value, $Res Function(_MissedAnimeDto) _then) = __$MissedAnimeDtoCopyWithImpl;
@override @useResult
$Res call({
 AnimeDto anime, int episodeMissed
});


@override $AnimeDtoCopyWith<$Res> get anime;

}
/// @nodoc
class __$MissedAnimeDtoCopyWithImpl<$Res>
    implements _$MissedAnimeDtoCopyWith<$Res> {
  __$MissedAnimeDtoCopyWithImpl(this._self, this._then);

  final _MissedAnimeDto _self;
  final $Res Function(_MissedAnimeDto) _then;

/// Create a copy of MissedAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? episodeMissed = null,}) {
  return _then(_MissedAnimeDto(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,episodeMissed: null == episodeMissed ? _self.episodeMissed : episodeMissed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MissedAnimeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeDtoCopyWith<$Res> get anime {
  
  return $AnimeDtoCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}

// dart format on
