// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_episode_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupedEpisodeDto {

 AnimeDto get anime; String get releaseDateTime; String get season; String get episodeType; String get number; String? get title; String? get description; int? get duration; List<String> get mappings; List<EpisodeSourceDto> get sources;
/// Create a copy of GroupedEpisodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupedEpisodeDtoCopyWith<GroupedEpisodeDto> get copyWith => _$GroupedEpisodeDtoCopyWithImpl<GroupedEpisodeDto>(this as GroupedEpisodeDto, _$identity);

  /// Serializes this GroupedEpisodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupedEpisodeDto&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.number, number) || other.number == number)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.mappings, mappings)&&const DeepCollectionEquality().equals(other.sources, sources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,releaseDateTime,season,episodeType,number,title,description,duration,const DeepCollectionEquality().hash(mappings),const DeepCollectionEquality().hash(sources));

@override
String toString() {
  return 'GroupedEpisodeDto(anime: $anime, releaseDateTime: $releaseDateTime, season: $season, episodeType: $episodeType, number: $number, title: $title, description: $description, duration: $duration, mappings: $mappings, sources: $sources)';
}


}

/// @nodoc
abstract mixin class $GroupedEpisodeDtoCopyWith<$Res>  {
  factory $GroupedEpisodeDtoCopyWith(GroupedEpisodeDto value, $Res Function(GroupedEpisodeDto) _then) = _$GroupedEpisodeDtoCopyWithImpl;
@useResult
$Res call({
 AnimeDto anime, String releaseDateTime, String season, String episodeType, String number, String? title, String? description, int? duration, List<String> mappings, List<EpisodeSourceDto> sources
});


$AnimeDtoCopyWith<$Res> get anime;

}
/// @nodoc
class _$GroupedEpisodeDtoCopyWithImpl<$Res>
    implements $GroupedEpisodeDtoCopyWith<$Res> {
  _$GroupedEpisodeDtoCopyWithImpl(this._self, this._then);

  final GroupedEpisodeDto _self;
  final $Res Function(GroupedEpisodeDto) _then;

/// Create a copy of GroupedEpisodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? releaseDateTime = null,Object? season = null,Object? episodeType = null,Object? number = null,Object? title = freezed,Object? description = freezed,Object? duration = freezed,Object? mappings = null,Object? sources = null,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,mappings: null == mappings ? _self.mappings : mappings // ignore: cast_nullable_to_non_nullable
as List<String>,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<EpisodeSourceDto>,
  ));
}
/// Create a copy of GroupedEpisodeDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeDtoCopyWith<$Res> get anime {
  
  return $AnimeDtoCopyWith<$Res>(_self.anime, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}


/// Adds pattern-matching-related methods to [GroupedEpisodeDto].
extension GroupedEpisodeDtoPatterns on GroupedEpisodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupedEpisodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupedEpisodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupedEpisodeDto value)  $default,){
final _that = this;
switch (_that) {
case _GroupedEpisodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupedEpisodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _GroupedEpisodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnimeDto anime,  String releaseDateTime,  String season,  String episodeType,  String number,  String? title,  String? description,  int? duration,  List<String> mappings,  List<EpisodeSourceDto> sources)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupedEpisodeDto() when $default != null:
return $default(_that.anime,_that.releaseDateTime,_that.season,_that.episodeType,_that.number,_that.title,_that.description,_that.duration,_that.mappings,_that.sources);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnimeDto anime,  String releaseDateTime,  String season,  String episodeType,  String number,  String? title,  String? description,  int? duration,  List<String> mappings,  List<EpisodeSourceDto> sources)  $default,) {final _that = this;
switch (_that) {
case _GroupedEpisodeDto():
return $default(_that.anime,_that.releaseDateTime,_that.season,_that.episodeType,_that.number,_that.title,_that.description,_that.duration,_that.mappings,_that.sources);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnimeDto anime,  String releaseDateTime,  String season,  String episodeType,  String number,  String? title,  String? description,  int? duration,  List<String> mappings,  List<EpisodeSourceDto> sources)?  $default,) {final _that = this;
switch (_that) {
case _GroupedEpisodeDto() when $default != null:
return $default(_that.anime,_that.releaseDateTime,_that.season,_that.episodeType,_that.number,_that.title,_that.description,_that.duration,_that.mappings,_that.sources);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupedEpisodeDto implements GroupedEpisodeDto {
  const _GroupedEpisodeDto({required this.anime, required this.releaseDateTime, required this.season, required this.episodeType, required this.number, required this.title, required this.description, required this.duration, required final  List<String> mappings, required final  List<EpisodeSourceDto> sources}): _mappings = mappings,_sources = sources;
  factory _GroupedEpisodeDto.fromJson(Map<String, dynamic> json) => _$GroupedEpisodeDtoFromJson(json);

@override final  AnimeDto anime;
@override final  String releaseDateTime;
@override final  String season;
@override final  String episodeType;
@override final  String number;
@override final  String? title;
@override final  String? description;
@override final  int? duration;
 final  List<String> _mappings;
@override List<String> get mappings {
  if (_mappings is EqualUnmodifiableListView) return _mappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mappings);
}

 final  List<EpisodeSourceDto> _sources;
@override List<EpisodeSourceDto> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}


/// Create a copy of GroupedEpisodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupedEpisodeDtoCopyWith<_GroupedEpisodeDto> get copyWith => __$GroupedEpisodeDtoCopyWithImpl<_GroupedEpisodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupedEpisodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupedEpisodeDto&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.number, number) || other.number == number)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._mappings, _mappings)&&const DeepCollectionEquality().equals(other._sources, _sources));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,releaseDateTime,season,episodeType,number,title,description,duration,const DeepCollectionEquality().hash(_mappings),const DeepCollectionEquality().hash(_sources));

@override
String toString() {
  return 'GroupedEpisodeDto(anime: $anime, releaseDateTime: $releaseDateTime, season: $season, episodeType: $episodeType, number: $number, title: $title, description: $description, duration: $duration, mappings: $mappings, sources: $sources)';
}


}

/// @nodoc
abstract mixin class _$GroupedEpisodeDtoCopyWith<$Res> implements $GroupedEpisodeDtoCopyWith<$Res> {
  factory _$GroupedEpisodeDtoCopyWith(_GroupedEpisodeDto value, $Res Function(_GroupedEpisodeDto) _then) = __$GroupedEpisodeDtoCopyWithImpl;
@override @useResult
$Res call({
 AnimeDto anime, String releaseDateTime, String season, String episodeType, String number, String? title, String? description, int? duration, List<String> mappings, List<EpisodeSourceDto> sources
});


@override $AnimeDtoCopyWith<$Res> get anime;

}
/// @nodoc
class __$GroupedEpisodeDtoCopyWithImpl<$Res>
    implements _$GroupedEpisodeDtoCopyWith<$Res> {
  __$GroupedEpisodeDtoCopyWithImpl(this._self, this._then);

  final _GroupedEpisodeDto _self;
  final $Res Function(_GroupedEpisodeDto) _then;

/// Create a copy of GroupedEpisodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? releaseDateTime = null,Object? season = null,Object? episodeType = null,Object? number = null,Object? title = freezed,Object? description = freezed,Object? duration = freezed,Object? mappings = null,Object? sources = null,}) {
  return _then(_GroupedEpisodeDto(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,mappings: null == mappings ? _self._mappings : mappings // ignore: cast_nullable_to_non_nullable
as List<String>,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<EpisodeSourceDto>,
  ));
}

/// Create a copy of GroupedEpisodeDto
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
