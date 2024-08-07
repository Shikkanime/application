// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_mapping_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpisodeMappingDto _$EpisodeMappingDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeMappingDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeMappingDto {
  String get uuid => throw _privateConstructorUsedError;
  AnimeDto get anime => throw _privateConstructorUsedError;
  String get releaseDateTime => throw _privateConstructorUsedError;
  String get lastReleaseDateTime => throw _privateConstructorUsedError;
  String get lastUpdateDateTime => throw _privateConstructorUsedError;
  String get episodeType => throw _privateConstructorUsedError;
  int get season => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<EpisodeVariantDto> get variants => throw _privateConstructorUsedError;
  List<PlatformDto> get platforms => throw _privateConstructorUsedError;
  List<String> get langTypes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this EpisodeMappingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpisodeMappingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeMappingDtoCopyWith<EpisodeMappingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeMappingDtoCopyWith<$Res> {
  factory $EpisodeMappingDtoCopyWith(
          EpisodeMappingDto value, $Res Function(EpisodeMappingDto) then) =
      _$EpisodeMappingDtoCopyWithImpl<$Res, EpisodeMappingDto>;
  @useResult
  $Res call(
      {String uuid,
      AnimeDto anime,
      String releaseDateTime,
      String lastReleaseDateTime,
      String lastUpdateDateTime,
      String episodeType,
      int season,
      int number,
      int duration,
      String? title,
      String? description,
      String image,
      List<EpisodeVariantDto> variants,
      List<PlatformDto> platforms,
      List<String> langTypes,
      String status});

  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class _$EpisodeMappingDtoCopyWithImpl<$Res, $Val extends EpisodeMappingDto>
    implements $EpisodeMappingDtoCopyWith<$Res> {
  _$EpisodeMappingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodeMappingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? anime = null,
    Object? releaseDateTime = null,
    Object? lastReleaseDateTime = null,
    Object? lastUpdateDateTime = null,
    Object? episodeType = null,
    Object? season = null,
    Object? number = null,
    Object? duration = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = null,
    Object? variants = null,
    Object? platforms = null,
    Object? langTypes = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _value.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      episodeType: null == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<EpisodeVariantDto>,
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformDto>,
      langTypes: null == langTypes
          ? _value.langTypes
          : langTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of EpisodeMappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeDtoCopyWith<$Res> get anime {
    return $AnimeDtoCopyWith<$Res>(_value.anime, (value) {
      return _then(_value.copyWith(anime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeMappingDtoImplCopyWith<$Res>
    implements $EpisodeMappingDtoCopyWith<$Res> {
  factory _$$EpisodeMappingDtoImplCopyWith(_$EpisodeMappingDtoImpl value,
          $Res Function(_$EpisodeMappingDtoImpl) then) =
      __$$EpisodeMappingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      AnimeDto anime,
      String releaseDateTime,
      String lastReleaseDateTime,
      String lastUpdateDateTime,
      String episodeType,
      int season,
      int number,
      int duration,
      String? title,
      String? description,
      String image,
      List<EpisodeVariantDto> variants,
      List<PlatformDto> platforms,
      List<String> langTypes,
      String status});

  @override
  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class __$$EpisodeMappingDtoImplCopyWithImpl<$Res>
    extends _$EpisodeMappingDtoCopyWithImpl<$Res, _$EpisodeMappingDtoImpl>
    implements _$$EpisodeMappingDtoImplCopyWith<$Res> {
  __$$EpisodeMappingDtoImplCopyWithImpl(_$EpisodeMappingDtoImpl _value,
      $Res Function(_$EpisodeMappingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpisodeMappingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? anime = null,
    Object? releaseDateTime = null,
    Object? lastReleaseDateTime = null,
    Object? lastUpdateDateTime = null,
    Object? episodeType = null,
    Object? season = null,
    Object? number = null,
    Object? duration = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = null,
    Object? variants = null,
    Object? platforms = null,
    Object? langTypes = null,
    Object? status = null,
  }) {
    return _then(_$EpisodeMappingDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _value.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      episodeType: null == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<EpisodeVariantDto>,
      platforms: null == platforms
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformDto>,
      langTypes: null == langTypes
          ? _value._langTypes
          : langTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeMappingDtoImpl implements _EpisodeMappingDto {
  const _$EpisodeMappingDtoImpl(
      {required this.uuid,
      required this.anime,
      required this.releaseDateTime,
      required this.lastReleaseDateTime,
      required this.lastUpdateDateTime,
      required this.episodeType,
      required this.season,
      required this.number,
      required this.duration,
      required this.title,
      required this.description,
      required this.image,
      required final List<EpisodeVariantDto> variants,
      required final List<PlatformDto> platforms,
      required final List<String> langTypes,
      required this.status})
      : _variants = variants,
        _platforms = platforms,
        _langTypes = langTypes;

  factory _$EpisodeMappingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeMappingDtoImplFromJson(json);

  @override
  final String uuid;
  @override
  final AnimeDto anime;
  @override
  final String releaseDateTime;
  @override
  final String lastReleaseDateTime;
  @override
  final String lastUpdateDateTime;
  @override
  final String episodeType;
  @override
  final int season;
  @override
  final int number;
  @override
  final int duration;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String image;
  final List<EpisodeVariantDto> _variants;
  @override
  List<EpisodeVariantDto> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final List<PlatformDto> _platforms;
  @override
  List<PlatformDto> get platforms {
    if (_platforms is EqualUnmodifiableListView) return _platforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  final List<String> _langTypes;
  @override
  List<String> get langTypes {
    if (_langTypes is EqualUnmodifiableListView) return _langTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_langTypes);
  }

  @override
  final String status;

  @override
  String toString() {
    return 'EpisodeMappingDto(uuid: $uuid, anime: $anime, releaseDateTime: $releaseDateTime, lastReleaseDateTime: $lastReleaseDateTime, lastUpdateDateTime: $lastUpdateDateTime, episodeType: $episodeType, season: $season, number: $number, duration: $duration, title: $title, description: $description, image: $image, variants: $variants, platforms: $platforms, langTypes: $langTypes, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeMappingDtoImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.lastReleaseDateTime, lastReleaseDateTime) ||
                other.lastReleaseDateTime == lastReleaseDateTime) &&
            (identical(other.lastUpdateDateTime, lastUpdateDateTime) ||
                other.lastUpdateDateTime == lastUpdateDateTime) &&
            (identical(other.episodeType, episodeType) ||
                other.episodeType == episodeType) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms) &&
            const DeepCollectionEquality()
                .equals(other._langTypes, _langTypes) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      anime,
      releaseDateTime,
      lastReleaseDateTime,
      lastUpdateDateTime,
      episodeType,
      season,
      number,
      duration,
      title,
      description,
      image,
      const DeepCollectionEquality().hash(_variants),
      const DeepCollectionEquality().hash(_platforms),
      const DeepCollectionEquality().hash(_langTypes),
      status);

  /// Create a copy of EpisodeMappingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeMappingDtoImplCopyWith<_$EpisodeMappingDtoImpl> get copyWith =>
      __$$EpisodeMappingDtoImplCopyWithImpl<_$EpisodeMappingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeMappingDtoImplToJson(
      this,
    );
  }
}

abstract class _EpisodeMappingDto implements EpisodeMappingDto {
  const factory _EpisodeMappingDto(
      {required final String uuid,
      required final AnimeDto anime,
      required final String releaseDateTime,
      required final String lastReleaseDateTime,
      required final String lastUpdateDateTime,
      required final String episodeType,
      required final int season,
      required final int number,
      required final int duration,
      required final String? title,
      required final String? description,
      required final String image,
      required final List<EpisodeVariantDto> variants,
      required final List<PlatformDto> platforms,
      required final List<String> langTypes,
      required final String status}) = _$EpisodeMappingDtoImpl;

  factory _EpisodeMappingDto.fromJson(Map<String, dynamic> json) =
      _$EpisodeMappingDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  AnimeDto get anime;
  @override
  String get releaseDateTime;
  @override
  String get lastReleaseDateTime;
  @override
  String get lastUpdateDateTime;
  @override
  String get episodeType;
  @override
  int get season;
  @override
  int get number;
  @override
  int get duration;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String get image;
  @override
  List<EpisodeVariantDto> get variants;
  @override
  List<PlatformDto> get platforms;
  @override
  List<String> get langTypes;
  @override
  String get status;

  /// Create a copy of EpisodeMappingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeMappingDtoImplCopyWith<_$EpisodeMappingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
