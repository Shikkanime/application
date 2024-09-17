// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_day_release_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeekDayReleaseDto _$WeekDayReleaseDtoFromJson(Map<String, dynamic> json) {
  return _WeekDayReleaseDto.fromJson(json);
}

/// @nodoc
mixin _$WeekDayReleaseDto {
  AnimeDto get anime => throw _privateConstructorUsedError;
  List<PlatformDto> get platforms => throw _privateConstructorUsedError;
  String get releaseDateTime => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get langType => throw _privateConstructorUsedError;
  String? get episodeType => throw _privateConstructorUsedError;
  int? get minNumber => throw _privateConstructorUsedError;
  int? get maxNumber => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  List<EpisodeMappingDto>? get mappings => throw _privateConstructorUsedError;

  /// Serializes this WeekDayReleaseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekDayReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekDayReleaseDtoCopyWith<WeekDayReleaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekDayReleaseDtoCopyWith<$Res> {
  factory $WeekDayReleaseDtoCopyWith(
          WeekDayReleaseDto value, $Res Function(WeekDayReleaseDto) then) =
      _$WeekDayReleaseDtoCopyWithImpl<$Res, WeekDayReleaseDto>;
  @useResult
  $Res call(
      {AnimeDto anime,
      List<PlatformDto> platforms,
      String releaseDateTime,
      String slug,
      String langType,
      String? episodeType,
      int? minNumber,
      int? maxNumber,
      int? number,
      List<EpisodeMappingDto>? mappings});

  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class _$WeekDayReleaseDtoCopyWithImpl<$Res, $Val extends WeekDayReleaseDto>
    implements $WeekDayReleaseDtoCopyWith<$Res> {
  _$WeekDayReleaseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekDayReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? platforms = null,
    Object? releaseDateTime = null,
    Object? slug = null,
    Object? langType = null,
    Object? episodeType = freezed,
    Object? minNumber = freezed,
    Object? maxNumber = freezed,
    Object? number = freezed,
    Object? mappings = freezed,
  }) {
    return _then(_value.copyWith(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformDto>,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      langType: null == langType
          ? _value.langType
          : langType // ignore: cast_nullable_to_non_nullable
              as String,
      episodeType: freezed == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String?,
      minNumber: freezed == minNumber
          ? _value.minNumber
          : minNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNumber: freezed == maxNumber
          ? _value.maxNumber
          : maxNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      mappings: freezed == mappings
          ? _value.mappings
          : mappings // ignore: cast_nullable_to_non_nullable
              as List<EpisodeMappingDto>?,
    ) as $Val);
  }

  /// Create a copy of WeekDayReleaseDto
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
abstract class _$$WeekDayReleaseDtoImplCopyWith<$Res>
    implements $WeekDayReleaseDtoCopyWith<$Res> {
  factory _$$WeekDayReleaseDtoImplCopyWith(_$WeekDayReleaseDtoImpl value,
          $Res Function(_$WeekDayReleaseDtoImpl) then) =
      __$$WeekDayReleaseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnimeDto anime,
      List<PlatformDto> platforms,
      String releaseDateTime,
      String slug,
      String langType,
      String? episodeType,
      int? minNumber,
      int? maxNumber,
      int? number,
      List<EpisodeMappingDto>? mappings});

  @override
  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class __$$WeekDayReleaseDtoImplCopyWithImpl<$Res>
    extends _$WeekDayReleaseDtoCopyWithImpl<$Res, _$WeekDayReleaseDtoImpl>
    implements _$$WeekDayReleaseDtoImplCopyWith<$Res> {
  __$$WeekDayReleaseDtoImplCopyWithImpl(_$WeekDayReleaseDtoImpl _value,
      $Res Function(_$WeekDayReleaseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekDayReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? platforms = null,
    Object? releaseDateTime = null,
    Object? slug = null,
    Object? langType = null,
    Object? episodeType = freezed,
    Object? minNumber = freezed,
    Object? maxNumber = freezed,
    Object? number = freezed,
    Object? mappings = freezed,
  }) {
    return _then(_$WeekDayReleaseDtoImpl(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      platforms: null == platforms
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformDto>,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      langType: null == langType
          ? _value.langType
          : langType // ignore: cast_nullable_to_non_nullable
              as String,
      episodeType: freezed == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String?,
      minNumber: freezed == minNumber
          ? _value.minNumber
          : minNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      maxNumber: freezed == maxNumber
          ? _value.maxNumber
          : maxNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      mappings: freezed == mappings
          ? _value._mappings
          : mappings // ignore: cast_nullable_to_non_nullable
              as List<EpisodeMappingDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekDayReleaseDtoImpl implements _WeekDayReleaseDto {
  const _$WeekDayReleaseDtoImpl(
      {required this.anime,
      required final List<PlatformDto> platforms,
      required this.releaseDateTime,
      required this.slug,
      required this.langType,
      required this.episodeType,
      required this.minNumber,
      required this.maxNumber,
      required this.number,
      required final List<EpisodeMappingDto>? mappings})
      : _platforms = platforms,
        _mappings = mappings;

  factory _$WeekDayReleaseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekDayReleaseDtoImplFromJson(json);

  @override
  final AnimeDto anime;
  final List<PlatformDto> _platforms;
  @override
  List<PlatformDto> get platforms {
    if (_platforms is EqualUnmodifiableListView) return _platforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  @override
  final String releaseDateTime;
  @override
  final String slug;
  @override
  final String langType;
  @override
  final String? episodeType;
  @override
  final int? minNumber;
  @override
  final int? maxNumber;
  @override
  final int? number;
  final List<EpisodeMappingDto>? _mappings;
  @override
  List<EpisodeMappingDto>? get mappings {
    final value = _mappings;
    if (value == null) return null;
    if (_mappings is EqualUnmodifiableListView) return _mappings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeekDayReleaseDto(anime: $anime, platforms: $platforms, releaseDateTime: $releaseDateTime, slug: $slug, langType: $langType, episodeType: $episodeType, minNumber: $minNumber, maxNumber: $maxNumber, number: $number, mappings: $mappings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekDayReleaseDtoImpl &&
            (identical(other.anime, anime) || other.anime == anime) &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.langType, langType) ||
                other.langType == langType) &&
            (identical(other.episodeType, episodeType) ||
                other.episodeType == episodeType) &&
            (identical(other.minNumber, minNumber) ||
                other.minNumber == minNumber) &&
            (identical(other.maxNumber, maxNumber) ||
                other.maxNumber == maxNumber) &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._mappings, _mappings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      anime,
      const DeepCollectionEquality().hash(_platforms),
      releaseDateTime,
      slug,
      langType,
      episodeType,
      minNumber,
      maxNumber,
      number,
      const DeepCollectionEquality().hash(_mappings));

  /// Create a copy of WeekDayReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekDayReleaseDtoImplCopyWith<_$WeekDayReleaseDtoImpl> get copyWith =>
      __$$WeekDayReleaseDtoImplCopyWithImpl<_$WeekDayReleaseDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekDayReleaseDtoImplToJson(
      this,
    );
  }
}

abstract class _WeekDayReleaseDto implements WeekDayReleaseDto {
  const factory _WeekDayReleaseDto(
          {required final AnimeDto anime,
          required final List<PlatformDto> platforms,
          required final String releaseDateTime,
          required final String slug,
          required final String langType,
          required final String? episodeType,
          required final int? minNumber,
          required final int? maxNumber,
          required final int? number,
          required final List<EpisodeMappingDto>? mappings}) =
      _$WeekDayReleaseDtoImpl;

  factory _WeekDayReleaseDto.fromJson(Map<String, dynamic> json) =
      _$WeekDayReleaseDtoImpl.fromJson;

  @override
  AnimeDto get anime;
  @override
  List<PlatformDto> get platforms;
  @override
  String get releaseDateTime;
  @override
  String get slug;
  @override
  String get langType;
  @override
  String? get episodeType;
  @override
  int? get minNumber;
  @override
  int? get maxNumber;
  @override
  int? get number;
  @override
  List<EpisodeMappingDto>? get mappings;

  /// Create a copy of WeekDayReleaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekDayReleaseDtoImplCopyWith<_$WeekDayReleaseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
