// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  String get uuid;
  String get countryCode;
  String get name;
  String get shortName;
  String get slug;
  String get releaseDateTime;
  String get lastReleaseDateTime;
  String? get lastUpdateDateTime;
  String get image;
  String get banner;
  String? get description;
  List<SimulcastDto>? get simulcasts;
  List<String>? get audioLocales;
  List<String>? get langTypes;
  List<SeasonDto>? get seasons;
  String? get status;
  List<AnimePlatformDto>? get platformIds;

  /// Create a copy of AnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnimeDtoCopyWith<AnimeDto> get copyWith =>
      _$AnimeDtoCopyWithImpl<AnimeDto>(this as AnimeDto, _$identity);

  /// Serializes this AnimeDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnimeDto &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.lastReleaseDateTime, lastReleaseDateTime) ||
                other.lastReleaseDateTime == lastReleaseDateTime) &&
            (identical(other.lastUpdateDateTime, lastUpdateDateTime) ||
                other.lastUpdateDateTime == lastUpdateDateTime) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.simulcasts, simulcasts) &&
            const DeepCollectionEquality()
                .equals(other.audioLocales, audioLocales) &&
            const DeepCollectionEquality().equals(other.langTypes, langTypes) &&
            const DeepCollectionEquality().equals(other.seasons, seasons) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.platformIds, platformIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      countryCode,
      name,
      shortName,
      slug,
      releaseDateTime,
      lastReleaseDateTime,
      lastUpdateDateTime,
      image,
      banner,
      description,
      const DeepCollectionEquality().hash(simulcasts),
      const DeepCollectionEquality().hash(audioLocales),
      const DeepCollectionEquality().hash(langTypes),
      const DeepCollectionEquality().hash(seasons),
      status,
      const DeepCollectionEquality().hash(platformIds));

  @override
  String toString() {
    return 'AnimeDto(uuid: $uuid, countryCode: $countryCode, name: $name, shortName: $shortName, slug: $slug, releaseDateTime: $releaseDateTime, lastReleaseDateTime: $lastReleaseDateTime, lastUpdateDateTime: $lastUpdateDateTime, image: $image, banner: $banner, description: $description, simulcasts: $simulcasts, audioLocales: $audioLocales, langTypes: $langTypes, seasons: $seasons, status: $status, platformIds: $platformIds)';
  }
}

/// @nodoc
abstract mixin class $AnimeDtoCopyWith<$Res> {
  factory $AnimeDtoCopyWith(AnimeDto value, $Res Function(AnimeDto) _then) =
      _$AnimeDtoCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String countryCode,
      String name,
      String shortName,
      String slug,
      String releaseDateTime,
      String lastReleaseDateTime,
      String? lastUpdateDateTime,
      String image,
      String banner,
      String? description,
      List<SimulcastDto>? simulcasts,
      List<String>? audioLocales,
      List<String>? langTypes,
      List<SeasonDto>? seasons,
      String? status,
      List<AnimePlatformDto>? platformIds});
}

/// @nodoc
class _$AnimeDtoCopyWithImpl<$Res> implements $AnimeDtoCopyWith<$Res> {
  _$AnimeDtoCopyWithImpl(this._self, this._then);

  final AnimeDto _self;
  final $Res Function(AnimeDto) _then;

  /// Create a copy of AnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? countryCode = null,
    Object? name = null,
    Object? shortName = null,
    Object? slug = null,
    Object? releaseDateTime = null,
    Object? lastReleaseDateTime = null,
    Object? lastUpdateDateTime = freezed,
    Object? image = null,
    Object? banner = null,
    Object? description = freezed,
    Object? simulcasts = freezed,
    Object? audioLocales = freezed,
    Object? langTypes = freezed,
    Object? seasons = freezed,
    Object? status = freezed,
    Object? platformIds = freezed,
  }) {
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _self.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _self.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: freezed == lastUpdateDateTime
          ? _self.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _self.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      simulcasts: freezed == simulcasts
          ? _self.simulcasts
          : simulcasts // ignore: cast_nullable_to_non_nullable
              as List<SimulcastDto>?,
      audioLocales: freezed == audioLocales
          ? _self.audioLocales
          : audioLocales // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      langTypes: freezed == langTypes
          ? _self.langTypes
          : langTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seasons: freezed == seasons
          ? _self.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<SeasonDto>?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      platformIds: freezed == platformIds
          ? _self.platformIds
          : platformIds // ignore: cast_nullable_to_non_nullable
              as List<AnimePlatformDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AnimeDto implements AnimeDto {
  const _AnimeDto(
      {required this.uuid,
      required this.countryCode,
      required this.name,
      required this.shortName,
      required this.slug,
      required this.releaseDateTime,
      required this.lastReleaseDateTime,
      required this.lastUpdateDateTime,
      required this.image,
      required this.banner,
      required this.description,
      required final List<SimulcastDto>? simulcasts,
      required final List<String>? audioLocales,
      required final List<String>? langTypes,
      required final List<SeasonDto>? seasons,
      required this.status,
      required final List<AnimePlatformDto>? platformIds})
      : _simulcasts = simulcasts,
        _audioLocales = audioLocales,
        _langTypes = langTypes,
        _seasons = seasons,
        _platformIds = platformIds;
  factory _AnimeDto.fromJson(Map<String, dynamic> json) =>
      _$AnimeDtoFromJson(json);

  @override
  final String uuid;
  @override
  final String countryCode;
  @override
  final String name;
  @override
  final String shortName;
  @override
  final String slug;
  @override
  final String releaseDateTime;
  @override
  final String lastReleaseDateTime;
  @override
  final String? lastUpdateDateTime;
  @override
  final String image;
  @override
  final String banner;
  @override
  final String? description;
  final List<SimulcastDto>? _simulcasts;
  @override
  List<SimulcastDto>? get simulcasts {
    final value = _simulcasts;
    if (value == null) return null;
    if (_simulcasts is EqualUnmodifiableListView) return _simulcasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _audioLocales;
  @override
  List<String>? get audioLocales {
    final value = _audioLocales;
    if (value == null) return null;
    if (_audioLocales is EqualUnmodifiableListView) return _audioLocales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _langTypes;
  @override
  List<String>? get langTypes {
    final value = _langTypes;
    if (value == null) return null;
    if (_langTypes is EqualUnmodifiableListView) return _langTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SeasonDto>? _seasons;
  @override
  List<SeasonDto>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  final List<AnimePlatformDto>? _platformIds;
  @override
  List<AnimePlatformDto>? get platformIds {
    final value = _platformIds;
    if (value == null) return null;
    if (_platformIds is EqualUnmodifiableListView) return _platformIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of AnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnimeDtoCopyWith<_AnimeDto> get copyWith =>
      __$AnimeDtoCopyWithImpl<_AnimeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnimeDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnimeDto &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.lastReleaseDateTime, lastReleaseDateTime) ||
                other.lastReleaseDateTime == lastReleaseDateTime) &&
            (identical(other.lastUpdateDateTime, lastUpdateDateTime) ||
                other.lastUpdateDateTime == lastUpdateDateTime) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._simulcasts, _simulcasts) &&
            const DeepCollectionEquality()
                .equals(other._audioLocales, _audioLocales) &&
            const DeepCollectionEquality()
                .equals(other._langTypes, _langTypes) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._platformIds, _platformIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      countryCode,
      name,
      shortName,
      slug,
      releaseDateTime,
      lastReleaseDateTime,
      lastUpdateDateTime,
      image,
      banner,
      description,
      const DeepCollectionEquality().hash(_simulcasts),
      const DeepCollectionEquality().hash(_audioLocales),
      const DeepCollectionEquality().hash(_langTypes),
      const DeepCollectionEquality().hash(_seasons),
      status,
      const DeepCollectionEquality().hash(_platformIds));

  @override
  String toString() {
    return 'AnimeDto(uuid: $uuid, countryCode: $countryCode, name: $name, shortName: $shortName, slug: $slug, releaseDateTime: $releaseDateTime, lastReleaseDateTime: $lastReleaseDateTime, lastUpdateDateTime: $lastUpdateDateTime, image: $image, banner: $banner, description: $description, simulcasts: $simulcasts, audioLocales: $audioLocales, langTypes: $langTypes, seasons: $seasons, status: $status, platformIds: $platformIds)';
  }
}

/// @nodoc
abstract mixin class _$AnimeDtoCopyWith<$Res>
    implements $AnimeDtoCopyWith<$Res> {
  factory _$AnimeDtoCopyWith(_AnimeDto value, $Res Function(_AnimeDto) _then) =
      __$AnimeDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uuid,
      String countryCode,
      String name,
      String shortName,
      String slug,
      String releaseDateTime,
      String lastReleaseDateTime,
      String? lastUpdateDateTime,
      String image,
      String banner,
      String? description,
      List<SimulcastDto>? simulcasts,
      List<String>? audioLocales,
      List<String>? langTypes,
      List<SeasonDto>? seasons,
      String? status,
      List<AnimePlatformDto>? platformIds});
}

/// @nodoc
class __$AnimeDtoCopyWithImpl<$Res> implements _$AnimeDtoCopyWith<$Res> {
  __$AnimeDtoCopyWithImpl(this._self, this._then);

  final _AnimeDto _self;
  final $Res Function(_AnimeDto) _then;

  /// Create a copy of AnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? countryCode = null,
    Object? name = null,
    Object? shortName = null,
    Object? slug = null,
    Object? releaseDateTime = null,
    Object? lastReleaseDateTime = null,
    Object? lastUpdateDateTime = freezed,
    Object? image = null,
    Object? banner = null,
    Object? description = freezed,
    Object? simulcasts = freezed,
    Object? audioLocales = freezed,
    Object? langTypes = freezed,
    Object? seasons = freezed,
    Object? status = freezed,
    Object? platformIds = freezed,
  }) {
    return _then(_AnimeDto(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _self.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _self.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: freezed == lastUpdateDateTime
          ? _self.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _self.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      simulcasts: freezed == simulcasts
          ? _self._simulcasts
          : simulcasts // ignore: cast_nullable_to_non_nullable
              as List<SimulcastDto>?,
      audioLocales: freezed == audioLocales
          ? _self._audioLocales
          : audioLocales // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      langTypes: freezed == langTypes
          ? _self._langTypes
          : langTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seasons: freezed == seasons
          ? _self._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<SeasonDto>?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      platformIds: freezed == platformIds
          ? _self._platformIds
          : platformIds // ignore: cast_nullable_to_non_nullable
              as List<AnimePlatformDto>?,
    ));
  }
}

// dart format on
