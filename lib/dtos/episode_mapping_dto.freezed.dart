// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_mapping_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeMappingDto {

 String get uuid; AnimeDto? get anime; String get releaseDateTime; int get season; String get episodeType; int get number; int get duration; String? get title; String? get description; List<EpisodeVariantDto>? get variants; List<PlatformDto> get platforms; List<String>? get langTypes;
/// Create a copy of EpisodeMappingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeMappingDtoCopyWith<EpisodeMappingDto> get copyWith => _$EpisodeMappingDtoCopyWithImpl<EpisodeMappingDto>(this as EpisodeMappingDto, _$identity);

  /// Serializes this EpisodeMappingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeMappingDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.number, number) || other.number == number)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.variants, variants)&&const DeepCollectionEquality().equals(other.platforms, platforms)&&const DeepCollectionEquality().equals(other.langTypes, langTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,anime,releaseDateTime,season,episodeType,number,duration,title,description,const DeepCollectionEquality().hash(variants),const DeepCollectionEquality().hash(platforms),const DeepCollectionEquality().hash(langTypes));

@override
String toString() {
  return 'EpisodeMappingDto(uuid: $uuid, anime: $anime, releaseDateTime: $releaseDateTime, season: $season, episodeType: $episodeType, number: $number, duration: $duration, title: $title, description: $description, variants: $variants, platforms: $platforms, langTypes: $langTypes)';
}


}

/// @nodoc
abstract mixin class $EpisodeMappingDtoCopyWith<$Res>  {
  factory $EpisodeMappingDtoCopyWith(EpisodeMappingDto value, $Res Function(EpisodeMappingDto) _then) = _$EpisodeMappingDtoCopyWithImpl;
@useResult
$Res call({
 String uuid, AnimeDto? anime, String releaseDateTime, int season, String episodeType, int number, int duration, String? title, String? description, List<EpisodeVariantDto>? variants, List<PlatformDto> platforms, List<String>? langTypes
});


$AnimeDtoCopyWith<$Res>? get anime;

}
/// @nodoc
class _$EpisodeMappingDtoCopyWithImpl<$Res>
    implements $EpisodeMappingDtoCopyWith<$Res> {
  _$EpisodeMappingDtoCopyWithImpl(this._self, this._then);

  final EpisodeMappingDto _self;
  final $Res Function(EpisodeMappingDto) _then;

/// Create a copy of EpisodeMappingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? anime = freezed,Object? releaseDateTime = null,Object? season = null,Object? episodeType = null,Object? number = null,Object? duration = null,Object? title = freezed,Object? description = freezed,Object? variants = freezed,Object? platforms = null,Object? langTypes = freezed,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto?,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<EpisodeVariantDto>?,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,langTypes: freezed == langTypes ? _self.langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of EpisodeMappingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeDtoCopyWith<$Res>? get anime {
    if (_self.anime == null) {
    return null;
  }

  return $AnimeDtoCopyWith<$Res>(_self.anime!, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EpisodeMappingDto implements EpisodeMappingDto {
  const _EpisodeMappingDto({required this.uuid, required this.anime, required this.releaseDateTime, required this.season, required this.episodeType, required this.number, required this.duration, required this.title, required this.description, required final  List<EpisodeVariantDto>? variants, required final  List<PlatformDto> platforms, required final  List<String>? langTypes}): _variants = variants,_platforms = platforms,_langTypes = langTypes;
  factory _EpisodeMappingDto.fromJson(Map<String, dynamic> json) => _$EpisodeMappingDtoFromJson(json);

@override final  String uuid;
@override final  AnimeDto? anime;
@override final  String releaseDateTime;
@override final  int season;
@override final  String episodeType;
@override final  int number;
@override final  int duration;
@override final  String? title;
@override final  String? description;
 final  List<EpisodeVariantDto>? _variants;
@override List<EpisodeVariantDto>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PlatformDto> _platforms;
@override List<PlatformDto> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

 final  List<String>? _langTypes;
@override List<String>? get langTypes {
  final value = _langTypes;
  if (value == null) return null;
  if (_langTypes is EqualUnmodifiableListView) return _langTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of EpisodeMappingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeMappingDtoCopyWith<_EpisodeMappingDto> get copyWith => __$EpisodeMappingDtoCopyWithImpl<_EpisodeMappingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeMappingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeMappingDto&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.anime, anime) || other.anime == anime)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.season, season) || other.season == season)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.number, number) || other.number == number)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._variants, _variants)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&const DeepCollectionEquality().equals(other._langTypes, _langTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,anime,releaseDateTime,season,episodeType,number,duration,title,description,const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_platforms),const DeepCollectionEquality().hash(_langTypes));

@override
String toString() {
  return 'EpisodeMappingDto(uuid: $uuid, anime: $anime, releaseDateTime: $releaseDateTime, season: $season, episodeType: $episodeType, number: $number, duration: $duration, title: $title, description: $description, variants: $variants, platforms: $platforms, langTypes: $langTypes)';
}


}

/// @nodoc
abstract mixin class _$EpisodeMappingDtoCopyWith<$Res> implements $EpisodeMappingDtoCopyWith<$Res> {
  factory _$EpisodeMappingDtoCopyWith(_EpisodeMappingDto value, $Res Function(_EpisodeMappingDto) _then) = __$EpisodeMappingDtoCopyWithImpl;
@override @useResult
$Res call({
 String uuid, AnimeDto? anime, String releaseDateTime, int season, String episodeType, int number, int duration, String? title, String? description, List<EpisodeVariantDto>? variants, List<PlatformDto> platforms, List<String>? langTypes
});


@override $AnimeDtoCopyWith<$Res>? get anime;

}
/// @nodoc
class __$EpisodeMappingDtoCopyWithImpl<$Res>
    implements _$EpisodeMappingDtoCopyWith<$Res> {
  __$EpisodeMappingDtoCopyWithImpl(this._self, this._then);

  final _EpisodeMappingDto _self;
  final $Res Function(_EpisodeMappingDto) _then;

/// Create a copy of EpisodeMappingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? anime = freezed,Object? releaseDateTime = null,Object? season = null,Object? episodeType = null,Object? number = null,Object? duration = null,Object? title = freezed,Object? description = freezed,Object? variants = freezed,Object? platforms = null,Object? langTypes = freezed,}) {
  return _then(_EpisodeMappingDto(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,anime: freezed == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto?,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,episodeType: null == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<EpisodeVariantDto>?,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,langTypes: freezed == langTypes ? _self._langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of EpisodeMappingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnimeDtoCopyWith<$Res>? get anime {
    if (_self.anime == null) {
    return null;
  }

  return $AnimeDtoCopyWith<$Res>(_self.anime!, (value) {
    return _then(_self.copyWith(anime: value));
  });
}
}

// dart format on
