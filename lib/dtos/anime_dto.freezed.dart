// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnimeDto _$AnimeDtoFromJson(Map<String, dynamic> json) {
  return _AnimeDto.fromJson(json);
}

/// @nodoc
mixin _$AnimeDto {
  String get uuid => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get releaseDateTime => throw _privateConstructorUsedError;
  String get lastReleaseDateTime => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<SimulcastDto> get simulcasts => throw _privateConstructorUsedError;
  List<String> get audioLocales => throw _privateConstructorUsedError;
  List<String> get langTypes => throw _privateConstructorUsedError;
  List<SeasonDto> get seasons => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeDtoCopyWith<AnimeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDtoCopyWith<$Res> {
  factory $AnimeDtoCopyWith(AnimeDto value, $Res Function(AnimeDto) then) =
      _$AnimeDtoCopyWithImpl<$Res, AnimeDto>;
  @useResult
  $Res call(
      {String uuid,
      String countryCode,
      String name,
      String shortName,
      String slug,
      String releaseDateTime,
      String lastReleaseDateTime,
      String image,
      String? banner,
      String? description,
      List<SimulcastDto> simulcasts,
      List<String> audioLocales,
      List<String> langTypes,
      List<SeasonDto> seasons,
      String? status});
}

/// @nodoc
class _$AnimeDtoCopyWithImpl<$Res, $Val extends AnimeDto>
    implements $AnimeDtoCopyWith<$Res> {
  _$AnimeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? image = null,
    Object? banner = freezed,
    Object? description = freezed,
    Object? simulcasts = null,
    Object? audioLocales = null,
    Object? langTypes = null,
    Object? seasons = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _value.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      simulcasts: null == simulcasts
          ? _value.simulcasts
          : simulcasts // ignore: cast_nullable_to_non_nullable
              as List<SimulcastDto>,
      audioLocales: null == audioLocales
          ? _value.audioLocales
          : audioLocales // ignore: cast_nullable_to_non_nullable
              as List<String>,
      langTypes: null == langTypes
          ? _value.langTypes
          : langTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seasons: null == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<SeasonDto>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeDtoImplCopyWith<$Res>
    implements $AnimeDtoCopyWith<$Res> {
  factory _$$AnimeDtoImplCopyWith(
          _$AnimeDtoImpl value, $Res Function(_$AnimeDtoImpl) then) =
      __$$AnimeDtoImplCopyWithImpl<$Res>;
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
      String image,
      String? banner,
      String? description,
      List<SimulcastDto> simulcasts,
      List<String> audioLocales,
      List<String> langTypes,
      List<SeasonDto> seasons,
      String? status});
}

/// @nodoc
class __$$AnimeDtoImplCopyWithImpl<$Res>
    extends _$AnimeDtoCopyWithImpl<$Res, _$AnimeDtoImpl>
    implements _$$AnimeDtoImplCopyWith<$Res> {
  __$$AnimeDtoImplCopyWithImpl(
      _$AnimeDtoImpl _value, $Res Function(_$AnimeDtoImpl) _then)
      : super(_value, _then);

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
    Object? image = null,
    Object? banner = freezed,
    Object? description = freezed,
    Object? simulcasts = null,
    Object? audioLocales = null,
    Object? langTypes = null,
    Object? seasons = null,
    Object? status = freezed,
  }) {
    return _then(_$AnimeDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _value.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      simulcasts: null == simulcasts
          ? _value._simulcasts
          : simulcasts // ignore: cast_nullable_to_non_nullable
              as List<SimulcastDto>,
      audioLocales: null == audioLocales
          ? _value._audioLocales
          : audioLocales // ignore: cast_nullable_to_non_nullable
              as List<String>,
      langTypes: null == langTypes
          ? _value._langTypes
          : langTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<SeasonDto>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeDtoImpl implements _AnimeDto {
  const _$AnimeDtoImpl(
      {required this.uuid,
      required this.countryCode,
      required this.name,
      required this.shortName,
      required this.slug,
      required this.releaseDateTime,
      required this.lastReleaseDateTime,
      required this.image,
      required this.banner,
      required this.description,
      required final List<SimulcastDto> simulcasts,
      required final List<String> audioLocales,
      required final List<String> langTypes,
      required final List<SeasonDto> seasons,
      required this.status})
      : _simulcasts = simulcasts,
        _audioLocales = audioLocales,
        _langTypes = langTypes,
        _seasons = seasons;

  factory _$AnimeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeDtoImplFromJson(json);

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
  final String image;
  @override
  final String? banner;
  @override
  final String? description;
  final List<SimulcastDto> _simulcasts;
  @override
  List<SimulcastDto> get simulcasts {
    if (_simulcasts is EqualUnmodifiableListView) return _simulcasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_simulcasts);
  }

  final List<String> _audioLocales;
  @override
  List<String> get audioLocales {
    if (_audioLocales is EqualUnmodifiableListView) return _audioLocales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioLocales);
  }

  final List<String> _langTypes;
  @override
  List<String> get langTypes {
    if (_langTypes is EqualUnmodifiableListView) return _langTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_langTypes);
  }

  final List<SeasonDto> _seasons;
  @override
  List<SeasonDto> get seasons {
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seasons);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'AnimeDto(uuid: $uuid, countryCode: $countryCode, name: $name, shortName: $shortName, slug: $slug, releaseDateTime: $releaseDateTime, lastReleaseDateTime: $lastReleaseDateTime, image: $image, banner: $banner, description: $description, simulcasts: $simulcasts, audioLocales: $audioLocales, langTypes: $langTypes, seasons: $seasons, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeDtoImpl &&
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
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
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
      image,
      banner,
      description,
      const DeepCollectionEquality().hash(_simulcasts),
      const DeepCollectionEquality().hash(_audioLocales),
      const DeepCollectionEquality().hash(_langTypes),
      const DeepCollectionEquality().hash(_seasons),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeDtoImplCopyWith<_$AnimeDtoImpl> get copyWith =>
      __$$AnimeDtoImplCopyWithImpl<_$AnimeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeDtoImplToJson(
      this,
    );
  }
}

abstract class _AnimeDto implements AnimeDto {
  const factory _AnimeDto(
      {required final String uuid,
      required final String countryCode,
      required final String name,
      required final String shortName,
      required final String slug,
      required final String releaseDateTime,
      required final String lastReleaseDateTime,
      required final String image,
      required final String? banner,
      required final String? description,
      required final List<SimulcastDto> simulcasts,
      required final List<String> audioLocales,
      required final List<String> langTypes,
      required final List<SeasonDto> seasons,
      required final String? status}) = _$AnimeDtoImpl;

  factory _AnimeDto.fromJson(Map<String, dynamic> json) =
      _$AnimeDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  String get countryCode;
  @override
  String get name;
  @override
  String get shortName;
  @override
  String get slug;
  @override
  String get releaseDateTime;
  @override
  String get lastReleaseDateTime;
  @override
  String get image;
  @override
  String? get banner;
  @override
  String? get description;
  @override
  List<SimulcastDto> get simulcasts;
  @override
  List<String> get audioLocales;
  @override
  List<String> get langTypes;
  @override
  List<SeasonDto> get seasons;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$AnimeDtoImplCopyWith<_$AnimeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
