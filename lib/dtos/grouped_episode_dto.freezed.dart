// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 AnimeDto get anime; List<PlatformDto> get platforms; String get releaseDateTime; String get season; String get episodeType; String get number; List<String> get langTypes; String? get title; String? get description; int? get duration; List<String> get mappings; List<String> get urls; bool get inWatchlist;
/// Create a copy of GroupedEpisodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupedEpisodeDtoCopyWith<GroupedEpisodeDto> get copyWith => _$GroupedEpisodeDtoCopyWithImpl<GroupedEpisodeDto>(this as GroupedEpisodeDto, _$identity);

  /// Serializes this GroupedEpisodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupedEpisodeDto&&(identical(other.anime, anime) || other.anime == anime)&&const DeepCollectionEquality().equals(other.platforms, platforms)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.number, number) || other.number == number)&&const DeepCollectionEquality().equals(other.langTypes, langTypes)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.mappings, mappings)&&const DeepCollectionEquality().equals(other.urls, urls)&&(identical(other.inWatchlist, inWatchlist) || other.inWatchlist == inWatchlist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,const DeepCollectionEquality().hash(platforms),releaseDateTime,season,episodeType,number,const DeepCollectionEquality().hash(langTypes),title,description,duration,const DeepCollectionEquality().hash(mappings),const DeepCollectionEquality().hash(urls),inWatchlist);

@override
String toString() {
  return 'GroupedEpisodeDto(anime: $anime, platforms: $platforms, releaseDateTime: $releaseDateTime, season: $season, episodeType: $episodeType, number: $number, langTypes: $langTypes, title: $title, description: $description, duration: $duration, mappings: $mappings, urls: $urls, inWatchlist: $inWatchlist)';
}


}

/// @nodoc
abstract mixin class $GroupedEpisodeDtoCopyWith<$Res>  {
  factory $GroupedEpisodeDtoCopyWith(GroupedEpisodeDto value, $Res Function(GroupedEpisodeDto) _then) = _$GroupedEpisodeDtoCopyWithImpl;
@useResult
$Res call({
 AnimeDto anime, List<PlatformDto> platforms, String releaseDateTime, String season, String episodeType, String number, List<String> langTypes, String? title, String? description, int? duration, List<String> mappings, List<String> urls, bool inWatchlist
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
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? platforms = null,Object? releaseDateTime = null,Object? season = null,Object? episodeType = null,Object? number = null,Object? langTypes = null,Object? title = freezed,Object? description = freezed,Object? duration = freezed,Object? mappings = null,Object? urls = null,Object? inWatchlist = null,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,langTypes: null == langTypes ? _self.langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,mappings: null == mappings ? _self.mappings : mappings // ignore: cast_nullable_to_non_nullable
as List<String>,urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,inWatchlist: null == inWatchlist ? _self.inWatchlist : inWatchlist // ignore: cast_nullable_to_non_nullable
as bool,
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


/// @nodoc
@JsonSerializable()

class _GroupedEpisodeDto implements GroupedEpisodeDto {
  const _GroupedEpisodeDto({required this.anime, required final  List<PlatformDto> platforms, required this.releaseDateTime, required this.season, required this.episodeType, required this.number, required final  List<String> langTypes, required this.title, required this.description, required this.duration, required final  List<String> mappings, required final  List<String> urls, required this.inWatchlist}): _platforms = platforms,_langTypes = langTypes,_mappings = mappings,_urls = urls;
  factory _GroupedEpisodeDto.fromJson(Map<String, dynamic> json) => _$GroupedEpisodeDtoFromJson(json);

@override final  AnimeDto anime;
 final  List<PlatformDto> _platforms;
@override List<PlatformDto> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

@override final  String releaseDateTime;
@override final  String season;
@override final  String episodeType;
@override final  String number;
 final  List<String> _langTypes;
@override List<String> get langTypes {
  if (_langTypes is EqualUnmodifiableListView) return _langTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_langTypes);
}

@override final  String? title;
@override final  String? description;
@override final  int? duration;
 final  List<String> _mappings;
@override List<String> get mappings {
  if (_mappings is EqualUnmodifiableListView) return _mappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mappings);
}

 final  List<String> _urls;
@override List<String> get urls {
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_urls);
}

@override final  bool inWatchlist;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupedEpisodeDto&&(identical(other.anime, anime) || other.anime == anime)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.number, number) || other.number == number)&&const DeepCollectionEquality().equals(other._langTypes, _langTypes)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._mappings, _mappings)&&const DeepCollectionEquality().equals(other._urls, _urls)&&(identical(other.inWatchlist, inWatchlist) || other.inWatchlist == inWatchlist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,const DeepCollectionEquality().hash(_platforms),releaseDateTime,season,episodeType,number,const DeepCollectionEquality().hash(_langTypes),title,description,duration,const DeepCollectionEquality().hash(_mappings),const DeepCollectionEquality().hash(_urls),inWatchlist);

@override
String toString() {
  return 'GroupedEpisodeDto(anime: $anime, platforms: $platforms, releaseDateTime: $releaseDateTime, season: $season, episodeType: $episodeType, number: $number, langTypes: $langTypes, title: $title, description: $description, duration: $duration, mappings: $mappings, urls: $urls, inWatchlist: $inWatchlist)';
}


}

/// @nodoc
abstract mixin class _$GroupedEpisodeDtoCopyWith<$Res> implements $GroupedEpisodeDtoCopyWith<$Res> {
  factory _$GroupedEpisodeDtoCopyWith(_GroupedEpisodeDto value, $Res Function(_GroupedEpisodeDto) _then) = __$GroupedEpisodeDtoCopyWithImpl;
@override @useResult
$Res call({
 AnimeDto anime, List<PlatformDto> platforms, String releaseDateTime, String season, String episodeType, String number, List<String> langTypes, String? title, String? description, int? duration, List<String> mappings, List<String> urls, bool inWatchlist
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
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? platforms = null,Object? releaseDateTime = null,Object? season = null,Object? episodeType = null,Object? number = null,Object? langTypes = null,Object? title = freezed,Object? description = freezed,Object? duration = freezed,Object? mappings = null,Object? urls = null,Object? inWatchlist = null,}) {
  return _then(_GroupedEpisodeDto(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,langTypes: null == langTypes ? _self._langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,mappings: null == mappings ? _self._mappings : mappings // ignore: cast_nullable_to_non_nullable
as List<String>,urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,inWatchlist: null == inWatchlist ? _self.inWatchlist : inWatchlist // ignore: cast_nullable_to_non_nullable
as bool,
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
