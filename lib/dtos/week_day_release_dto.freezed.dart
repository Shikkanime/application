// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_day_release_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekDayReleaseDto {

 AnimeDto get anime; List<PlatformDto> get platforms; String get releaseDateTime; String get slug; List<String> get langTypes; String? get episodeType; int? get minNumber; int? get maxNumber; int? get number; List<EpisodeMappingDto>? get mappings;
/// Create a copy of WeekDayReleaseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekDayReleaseDtoCopyWith<WeekDayReleaseDto> get copyWith => _$WeekDayReleaseDtoCopyWithImpl<WeekDayReleaseDto>(this as WeekDayReleaseDto, _$identity);

  /// Serializes this WeekDayReleaseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekDayReleaseDto&&(identical(other.anime, anime) || other.anime == anime)&&const DeepCollectionEquality().equals(other.platforms, platforms)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other.langTypes, langTypes)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.minNumber, minNumber) || other.minNumber == minNumber)&&(identical(other.maxNumber, maxNumber) || other.maxNumber == maxNumber)&&(identical(other.number, number) || other.number == number)&&const DeepCollectionEquality().equals(other.mappings, mappings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,const DeepCollectionEquality().hash(platforms),releaseDateTime,slug,const DeepCollectionEquality().hash(langTypes),episodeType,minNumber,maxNumber,number,const DeepCollectionEquality().hash(mappings));

@override
String toString() {
  return 'WeekDayReleaseDto(anime: $anime, platforms: $platforms, releaseDateTime: $releaseDateTime, slug: $slug, langTypes: $langTypes, episodeType: $episodeType, minNumber: $minNumber, maxNumber: $maxNumber, number: $number, mappings: $mappings)';
}


}

/// @nodoc
abstract mixin class $WeekDayReleaseDtoCopyWith<$Res>  {
  factory $WeekDayReleaseDtoCopyWith(WeekDayReleaseDto value, $Res Function(WeekDayReleaseDto) _then) = _$WeekDayReleaseDtoCopyWithImpl;
@useResult
$Res call({
 AnimeDto anime, List<PlatformDto> platforms, String releaseDateTime, String slug, List<String> langTypes, String? episodeType, int? minNumber, int? maxNumber, int? number, List<EpisodeMappingDto>? mappings
});


$AnimeDtoCopyWith<$Res> get anime;

}
/// @nodoc
class _$WeekDayReleaseDtoCopyWithImpl<$Res>
    implements $WeekDayReleaseDtoCopyWith<$Res> {
  _$WeekDayReleaseDtoCopyWithImpl(this._self, this._then);

  final WeekDayReleaseDto _self;
  final $Res Function(WeekDayReleaseDto) _then;

/// Create a copy of WeekDayReleaseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anime = null,Object? platforms = null,Object? releaseDateTime = null,Object? slug = null,Object? langTypes = null,Object? episodeType = freezed,Object? minNumber = freezed,Object? maxNumber = freezed,Object? number = freezed,Object? mappings = freezed,}) {
  return _then(_self.copyWith(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,langTypes: null == langTypes ? _self.langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,minNumber: freezed == minNumber ? _self.minNumber : minNumber // ignore: cast_nullable_to_non_nullable
as int?,maxNumber: freezed == maxNumber ? _self.maxNumber : maxNumber // ignore: cast_nullable_to_non_nullable
as int?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,mappings: freezed == mappings ? _self.mappings : mappings // ignore: cast_nullable_to_non_nullable
as List<EpisodeMappingDto>?,
  ));
}
/// Create a copy of WeekDayReleaseDto
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

class _WeekDayReleaseDto implements WeekDayReleaseDto {
  const _WeekDayReleaseDto({required this.anime, required final  List<PlatformDto> platforms, required this.releaseDateTime, required this.slug, required final  List<String> langTypes, required this.episodeType, required this.minNumber, required this.maxNumber, required this.number, required final  List<EpisodeMappingDto>? mappings}): _platforms = platforms,_langTypes = langTypes,_mappings = mappings;
  factory _WeekDayReleaseDto.fromJson(Map<String, dynamic> json) => _$WeekDayReleaseDtoFromJson(json);

@override final  AnimeDto anime;
 final  List<PlatformDto> _platforms;
@override List<PlatformDto> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

@override final  String releaseDateTime;
@override final  String slug;
 final  List<String> _langTypes;
@override List<String> get langTypes {
  if (_langTypes is EqualUnmodifiableListView) return _langTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_langTypes);
}

@override final  String? episodeType;
@override final  int? minNumber;
@override final  int? maxNumber;
@override final  int? number;
 final  List<EpisodeMappingDto>? _mappings;
@override List<EpisodeMappingDto>? get mappings {
  final value = _mappings;
  if (value == null) return null;
  if (_mappings is EqualUnmodifiableListView) return _mappings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WeekDayReleaseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekDayReleaseDtoCopyWith<_WeekDayReleaseDto> get copyWith => __$WeekDayReleaseDtoCopyWithImpl<_WeekDayReleaseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekDayReleaseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekDayReleaseDto&&(identical(other.anime, anime) || other.anime == anime)&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&(identical(other.releaseDateTime, releaseDateTime) || other.releaseDateTime == releaseDateTime)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other._langTypes, _langTypes)&&(identical(other.episodeType, episodeType) || other.episodeType == episodeType)&&(identical(other.minNumber, minNumber) || other.minNumber == minNumber)&&(identical(other.maxNumber, maxNumber) || other.maxNumber == maxNumber)&&(identical(other.number, number) || other.number == number)&&const DeepCollectionEquality().equals(other._mappings, _mappings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anime,const DeepCollectionEquality().hash(_platforms),releaseDateTime,slug,const DeepCollectionEquality().hash(_langTypes),episodeType,minNumber,maxNumber,number,const DeepCollectionEquality().hash(_mappings));

@override
String toString() {
  return 'WeekDayReleaseDto(anime: $anime, platforms: $platforms, releaseDateTime: $releaseDateTime, slug: $slug, langTypes: $langTypes, episodeType: $episodeType, minNumber: $minNumber, maxNumber: $maxNumber, number: $number, mappings: $mappings)';
}


}

/// @nodoc
abstract mixin class _$WeekDayReleaseDtoCopyWith<$Res> implements $WeekDayReleaseDtoCopyWith<$Res> {
  factory _$WeekDayReleaseDtoCopyWith(_WeekDayReleaseDto value, $Res Function(_WeekDayReleaseDto) _then) = __$WeekDayReleaseDtoCopyWithImpl;
@override @useResult
$Res call({
 AnimeDto anime, List<PlatformDto> platforms, String releaseDateTime, String slug, List<String> langTypes, String? episodeType, int? minNumber, int? maxNumber, int? number, List<EpisodeMappingDto>? mappings
});


@override $AnimeDtoCopyWith<$Res> get anime;

}
/// @nodoc
class __$WeekDayReleaseDtoCopyWithImpl<$Res>
    implements _$WeekDayReleaseDtoCopyWith<$Res> {
  __$WeekDayReleaseDtoCopyWithImpl(this._self, this._then);

  final _WeekDayReleaseDto _self;
  final $Res Function(_WeekDayReleaseDto) _then;

/// Create a copy of WeekDayReleaseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anime = null,Object? platforms = null,Object? releaseDateTime = null,Object? slug = null,Object? langTypes = null,Object? episodeType = freezed,Object? minNumber = freezed,Object? maxNumber = freezed,Object? number = freezed,Object? mappings = freezed,}) {
  return _then(_WeekDayReleaseDto(
anime: null == anime ? _self.anime : anime // ignore: cast_nullable_to_non_nullable
as AnimeDto,platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<PlatformDto>,releaseDateTime: null == releaseDateTime ? _self.releaseDateTime : releaseDateTime // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,langTypes: null == langTypes ? _self._langTypes : langTypes // ignore: cast_nullable_to_non_nullable
as List<String>,episodeType: freezed == episodeType ? _self.episodeType : episodeType // ignore: cast_nullable_to_non_nullable
as String?,minNumber: freezed == minNumber ? _self.minNumber : minNumber // ignore: cast_nullable_to_non_nullable
as int?,maxNumber: freezed == maxNumber ? _self.maxNumber : maxNumber // ignore: cast_nullable_to_non_nullable
as int?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,mappings: freezed == mappings ? _self._mappings : mappings // ignore: cast_nullable_to_non_nullable
as List<EpisodeMappingDto>?,
  ));
}

/// Create a copy of WeekDayReleaseDto
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
