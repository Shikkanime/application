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
  String get releaseDateTime => throw _privateConstructorUsedError;
  String get langType => throw _privateConstructorUsedError;
  List<PlatformDto> get platforms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String releaseDateTime,
      String langType,
      List<PlatformDto> platforms});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? releaseDateTime = null,
    Object? langType = null,
    Object? platforms = null,
  }) {
    return _then(_value.copyWith(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      langType: null == langType
          ? _value.langType
          : langType // ignore: cast_nullable_to_non_nullable
              as String,
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformDto>,
    ) as $Val);
  }

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
      String releaseDateTime,
      String langType,
      List<PlatformDto> platforms});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? releaseDateTime = null,
    Object? langType = null,
    Object? platforms = null,
  }) {
    return _then(_$WeekDayReleaseDtoImpl(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      langType: null == langType
          ? _value.langType
          : langType // ignore: cast_nullable_to_non_nullable
              as String,
      platforms: null == platforms
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<PlatformDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekDayReleaseDtoImpl implements _WeekDayReleaseDto {
  const _$WeekDayReleaseDtoImpl(
      {required this.anime,
      required this.releaseDateTime,
      required this.langType,
      required final List<PlatformDto> platforms})
      : _platforms = platforms;

  factory _$WeekDayReleaseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekDayReleaseDtoImplFromJson(json);

  @override
  final AnimeDto anime;
  @override
  final String releaseDateTime;
  @override
  final String langType;
  final List<PlatformDto> _platforms;
  @override
  List<PlatformDto> get platforms {
    if (_platforms is EqualUnmodifiableListView) return _platforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  @override
  String toString() {
    return 'WeekDayReleaseDto(anime: $anime, releaseDateTime: $releaseDateTime, langType: $langType, platforms: $platforms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekDayReleaseDtoImpl &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.langType, langType) ||
                other.langType == langType) &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, anime, releaseDateTime, langType,
      const DeepCollectionEquality().hash(_platforms));

  @JsonKey(ignore: true)
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
      required final String releaseDateTime,
      required final String langType,
      required final List<PlatformDto> platforms}) = _$WeekDayReleaseDtoImpl;

  factory _WeekDayReleaseDto.fromJson(Map<String, dynamic> json) =
      _$WeekDayReleaseDtoImpl.fromJson;

  @override
  AnimeDto get anime;
  @override
  String get releaseDateTime;
  @override
  String get langType;
  @override
  List<PlatformDto> get platforms;
  @override
  @JsonKey(ignore: true)
  _$$WeekDayReleaseDtoImplCopyWith<_$WeekDayReleaseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
