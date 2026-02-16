// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeDto {

 String get uuid; String get countryCode; String get name; String get shortName; String get slug; String get releaseDateTime; String? get description; List<String>? get langTypes; List<SeasonDto>? get seasons; List<AnimePlatformDto>? get platformIds; List<GenreDto>? get genres; List<AnimeTagDto>? get tags; bool? get hasCarousel;
/// Create a copy of AnimeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimeDtoCopyWith<AnimeDto> get copyWith => _$AnimeDtoCopyWithImpl<AnimeDto>(this as AnimeDto, _$identity);

  /// Serializes this AnimeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimeDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.langTypes, langTypes)&&const DeepCollectionEquality().equals(other.seasons, seasons)&&const DeepCollectionEquality().equals(other.platformIds, platformIds)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.hasCarousel, hasCarousel) || other.hasCarousel == hasCarousel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,countryCode,name,shortName,slug,releaseDateTime,description,const DeepCollectionEquality().hash(langTypes),const DeepCollectionEquality().hash(seasons),const DeepCollectionEquality().hash(platformIds),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(tags),hasCarousel);

@override
String toString() {
  return 'AnimeDto(uuid: $uuid, countryCode: $countryCode, name: $name, shortName: $shortName, slug: $slug, releaseDateTime: $releaseDateTime, description: $description, langTypes: $langTypes, seasons: $seasons, platformIds: $platformIds, genres: $genres, tags: $tags, hasCarousel: $hasCarousel)';
}


}

/// @nodoc
abstract mixin class $AnimeDtoCopyWith<$Res>  {
  factory $AnimeDtoCopyWith(AnimeDto value, $Res Function(AnimeDto) _then) = _$AnimeDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, String countryCode, String name, String shortName, String slug, String releaseDateTime, String? description, List<String>? langTypes, List<SeasonDto>? seasons, List<AnimePlatformDto>? platformIds, List<GenreDto>? genres, List<AnimeTagDto>? tags, bool? hasCarousel
});




}
/// @nodoc
class _$AnimeDtoCopyWithImpl<$Res>
    implements $AnimeDtoCopyWith<$Res> {
  _$AnimeDtoCopyWithImpl(this._self, this._then);

  final AnimeDto _self;
  final $Res Function(AnimeDto) _then;

/// Create a copy of AnimeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? countryCode = null,Object? name = null,Object? shortName = null,Object? slug = null,Object? releaseDateTime = null,Object? description = freezed,Object? langTypes = freezed,Object? seasons = freezed,Object? platformIds = freezed,Object? genres = freezed,Object? tags = freezed,Object? hasCarousel = freezed,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,langTypes: freezed == langTypes ? _self.langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,seasons: freezed == seasons ? _self.seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonDto>?,platformIds: freezed == platformIds ? _self.platformIds : platformIds // ignore: cast_nullable_to_non_nullable
as List<AnimePlatformDto>?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreDto>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<AnimeTagDto>?,hasCarousel: freezed == hasCarousel ? _self.hasCarousel : hasCarousel // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimeDto].
extension AnimeDtoPatterns on AnimeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimeDto value)  $default,){
final _that = this;
switch (_that) {
case _AnimeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimeDto value)?  $default,){
final _that = this;
switch (_that) {
case _AnimeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  String countryCode,  String name,  String shortName,  String slug,  String releaseDateTime,  String? description,  List<String>? langTypes,  List<SeasonDto>? seasons,  List<AnimePlatformDto>? platformIds,  List<GenreDto>? genres,  List<AnimeTagDto>? tags,  bool? hasCarousel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimeDto() when $default != null:
return $default(_that.uuid,_that.countryCode,_that.name,_that.shortName,_that.slug,_that.releaseDateTime,_that.description,_that.langTypes,_that.seasons,_that.platformIds,_that.genres,_that.tags,_that.hasCarousel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  String countryCode,  String name,  String shortName,  String slug,  String releaseDateTime,  String? description,  List<String>? langTypes,  List<SeasonDto>? seasons,  List<AnimePlatformDto>? platformIds,  List<GenreDto>? genres,  List<AnimeTagDto>? tags,  bool? hasCarousel)  $default,) {final _that = this;
switch (_that) {
case _AnimeDto():
return $default(_that.uuid,_that.countryCode,_that.name,_that.shortName,_that.slug,_that.releaseDateTime,_that.description,_that.langTypes,_that.seasons,_that.platformIds,_that.genres,_that.tags,_that.hasCarousel);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  String countryCode,  String name,  String shortName,  String slug,  String releaseDateTime,  String? description,  List<String>? langTypes,  List<SeasonDto>? seasons,  List<AnimePlatformDto>? platformIds,  List<GenreDto>? genres,  List<AnimeTagDto>? tags,  bool? hasCarousel)?  $default,) {final _that = this;
switch (_that) {
case _AnimeDto() when $default != null:
return $default(_that.uuid,_that.countryCode,_that.name,_that.shortName,_that.slug,_that.releaseDateTime,_that.description,_that.langTypes,_that.seasons,_that.platformIds,_that.genres,_that.tags,_that.hasCarousel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimeDto implements AnimeDto {
  const _AnimeDto({required this.uuid, required this.countryCode, required this.name, required this.shortName, required this.slug, required this.releaseDateTime, required this.description, required final  List<String>? langTypes, required final  List<SeasonDto>? seasons, required final  List<AnimePlatformDto>? platformIds, required final  List<GenreDto>? genres, required final  List<AnimeTagDto>? tags, required this.hasCarousel}): _langTypes = langTypes,_seasons = seasons,_platformIds = platformIds,_genres = genres,_tags = tags;
  factory _AnimeDto.fromJson(Map<String, dynamic> json) => _$AnimeDtoFromJson(json);

@override final  String uuid;
@override final  String countryCode;
@override final  String name;
@override final  String shortName;
@override final  String slug;
@override final  String releaseDateTime;
@override final  String? description;
 final  List<String>? _langTypes;
@override List<String>? get langTypes {
  final value = _langTypes;
  if (value == null) return null;
  if (_langTypes is EqualUnmodifiableListView) return _langTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SeasonDto>? _seasons;
@override List<SeasonDto>? get seasons {
  final value = _seasons;
  if (value == null) return null;
  if (_seasons is EqualUnmodifiableListView) return _seasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AnimePlatformDto>? _platformIds;
@override List<AnimePlatformDto>? get platformIds {
  final value = _platformIds;
  if (value == null) return null;
  if (_platformIds is EqualUnmodifiableListView) return _platformIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<GenreDto>? _genres;
@override List<GenreDto>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AnimeTagDto>? _tags;
@override List<AnimeTagDto>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? hasCarousel;

/// Create a copy of AnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimeDtoCopyWith<_AnimeDto> get copyWith => __$AnimeDtoCopyWithImpl<_AnimeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimeDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._langTypes, _langTypes)&&const DeepCollectionEquality().equals(other._seasons, _seasons)&&const DeepCollectionEquality().equals(other._platformIds, _platformIds)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.hasCarousel, hasCarousel) || other.hasCarousel == hasCarousel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,countryCode,name,shortName,slug,releaseDateTime,description,const DeepCollectionEquality().hash(_langTypes),const DeepCollectionEquality().hash(_seasons),const DeepCollectionEquality().hash(_platformIds),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_tags),hasCarousel);

@override
String toString() {
  return 'AnimeDto(uuid: $uuid, countryCode: $countryCode, name: $name, shortName: $shortName, slug: $slug, releaseDateTime: $releaseDateTime, description: $description, langTypes: $langTypes, seasons: $seasons, platformIds: $platformIds, genres: $genres, tags: $tags, hasCarousel: $hasCarousel)';
}


}

/// @nodoc
abstract mixin class _$AnimeDtoCopyWith<$Res> implements $AnimeDtoCopyWith<$Res> {
  factory _$AnimeDtoCopyWith(_AnimeDto value, $Res Function(_AnimeDto) _then) = __$AnimeDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, String countryCode, String name, String shortName, String slug, String releaseDateTime, String? description, List<String>? langTypes, List<SeasonDto>? seasons, List<AnimePlatformDto>? platformIds, List<GenreDto>? genres, List<AnimeTagDto>? tags, bool? hasCarousel
});




}
/// @nodoc
class __$AnimeDtoCopyWithImpl<$Res>
    implements _$AnimeDtoCopyWith<$Res> {
  __$AnimeDtoCopyWithImpl(this._self, this._then);

  final _AnimeDto _self;
  final $Res Function(_AnimeDto) _then;

/// Create a copy of AnimeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? countryCode = null,Object? name = null,Object? shortName = null,Object? slug = null,Object? releaseDateTime = null,Object? description = freezed,Object? langTypes = freezed,Object? seasons = freezed,Object? platformIds = freezed,Object? genres = freezed,Object? tags = freezed,Object? hasCarousel = freezed,}) {
  return _then(_AnimeDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,langTypes: freezed == langTypes ? _self._langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,seasons: freezed == seasons ? _self._seasons : seasons // ignore: cast_nullable_to_non_nullable
as List<SeasonDto>?,platformIds: freezed == platformIds ? _self._platformIds : platformIds // ignore: cast_nullable_to_non_nullable
as List<AnimePlatformDto>?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreDto>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<AnimeTagDto>?,hasCarousel: freezed == hasCarousel ? _self.hasCarousel : hasCarousel // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
