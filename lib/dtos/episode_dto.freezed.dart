// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpisodeDto _$EpisodeDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeDto {
  String get uuid => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  AnimeDto get anime => throw _privateConstructorUsedError;
  String get episodeType => throw _privateConstructorUsedError;
  String get langType => throw _privateConstructorUsedError;
  String get hash => throw _privateConstructorUsedError;
  String get releaseDateTime => throw _privateConstructorUsedError;
  int get season => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get uncensored => throw _privateConstructorUsedError;
  String get lastUpdateDateTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeDtoCopyWith<EpisodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeDtoCopyWith<$Res> {
  factory $EpisodeDtoCopyWith(
          EpisodeDto value, $Res Function(EpisodeDto) then) =
      _$EpisodeDtoCopyWithImpl<$Res, EpisodeDto>;
  @useResult
  $Res call(
      {String uuid,
      String platform,
      AnimeDto anime,
      String episodeType,
      String langType,
      String hash,
      String releaseDateTime,
      int season,
      int number,
      String? title,
      String url,
      String image,
      int duration,
      String? description,
      bool uncensored,
      String lastUpdateDateTime,
      String status});

  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class _$EpisodeDtoCopyWithImpl<$Res, $Val extends EpisodeDto>
    implements $EpisodeDtoCopyWith<$Res> {
  _$EpisodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? platform = null,
    Object? anime = null,
    Object? episodeType = null,
    Object? langType = null,
    Object? hash = null,
    Object? releaseDateTime = null,
    Object? season = null,
    Object? number = null,
    Object? title = freezed,
    Object? url = null,
    Object? image = null,
    Object? duration = null,
    Object? description = freezed,
    Object? uncensored = null,
    Object? lastUpdateDateTime = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      episodeType: null == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String,
      langType: null == langType
          ? _value.langType
          : langType // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      uncensored: null == uncensored
          ? _value.uncensored
          : uncensored // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$EpisodeDtoImplCopyWith<$Res>
    implements $EpisodeDtoCopyWith<$Res> {
  factory _$$EpisodeDtoImplCopyWith(
          _$EpisodeDtoImpl value, $Res Function(_$EpisodeDtoImpl) then) =
      __$$EpisodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String platform,
      AnimeDto anime,
      String episodeType,
      String langType,
      String hash,
      String releaseDateTime,
      int season,
      int number,
      String? title,
      String url,
      String image,
      int duration,
      String? description,
      bool uncensored,
      String lastUpdateDateTime,
      String status});

  @override
  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class __$$EpisodeDtoImplCopyWithImpl<$Res>
    extends _$EpisodeDtoCopyWithImpl<$Res, _$EpisodeDtoImpl>
    implements _$$EpisodeDtoImplCopyWith<$Res> {
  __$$EpisodeDtoImplCopyWithImpl(
      _$EpisodeDtoImpl _value, $Res Function(_$EpisodeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? platform = null,
    Object? anime = null,
    Object? episodeType = null,
    Object? langType = null,
    Object? hash = null,
    Object? releaseDateTime = null,
    Object? season = null,
    Object? number = null,
    Object? title = freezed,
    Object? url = null,
    Object? image = null,
    Object? duration = null,
    Object? description = freezed,
    Object? uncensored = null,
    Object? lastUpdateDateTime = null,
    Object? status = null,
  }) {
    return _then(_$EpisodeDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      episodeType: null == episodeType
          ? _value.episodeType
          : episodeType // ignore: cast_nullable_to_non_nullable
              as String,
      langType: null == langType
          ? _value.langType
          : langType // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      uncensored: null == uncensored
          ? _value.uncensored
          : uncensored // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeDtoImpl implements _EpisodeDto {
  const _$EpisodeDtoImpl(
      {required this.uuid,
      required this.platform,
      required this.anime,
      required this.episodeType,
      required this.langType,
      required this.hash,
      required this.releaseDateTime,
      required this.season,
      required this.number,
      required this.title,
      required this.url,
      required this.image,
      required this.duration,
      required this.description,
      required this.uncensored,
      required this.lastUpdateDateTime,
      required this.status});

  factory _$EpisodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeDtoImplFromJson(json);

  @override
  final String uuid;
  @override
  final String platform;
  @override
  final AnimeDto anime;
  @override
  final String episodeType;
  @override
  final String langType;
  @override
  final String hash;
  @override
  final String releaseDateTime;
  @override
  final int season;
  @override
  final int number;
  @override
  final String? title;
  @override
  final String url;
  @override
  final String image;
  @override
  final int duration;
  @override
  final String? description;
  @override
  final bool uncensored;
  @override
  final String lastUpdateDateTime;
  @override
  final String status;

  @override
  String toString() {
    return 'EpisodeDto(uuid: $uuid, platform: $platform, anime: $anime, episodeType: $episodeType, langType: $langType, hash: $hash, releaseDateTime: $releaseDateTime, season: $season, number: $number, title: $title, url: $url, image: $image, duration: $duration, description: $description, uncensored: $uncensored, lastUpdateDateTime: $lastUpdateDateTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeDtoImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.episodeType, episodeType) ||
                other.episodeType == episodeType) &&
            (identical(other.langType, langType) ||
                other.langType == langType) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.uncensored, uncensored) ||
                other.uncensored == uncensored) &&
            (identical(other.lastUpdateDateTime, lastUpdateDateTime) ||
                other.lastUpdateDateTime == lastUpdateDateTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      platform,
      anime,
      episodeType,
      langType,
      hash,
      releaseDateTime,
      season,
      number,
      title,
      url,
      image,
      duration,
      description,
      uncensored,
      lastUpdateDateTime,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeDtoImplCopyWith<_$EpisodeDtoImpl> get copyWith =>
      __$$EpisodeDtoImplCopyWithImpl<_$EpisodeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeDtoImplToJson(
      this,
    );
  }
}

abstract class _EpisodeDto implements EpisodeDto {
  const factory _EpisodeDto(
      {required final String uuid,
      required final String platform,
      required final AnimeDto anime,
      required final String episodeType,
      required final String langType,
      required final String hash,
      required final String releaseDateTime,
      required final int season,
      required final int number,
      required final String? title,
      required final String url,
      required final String image,
      required final int duration,
      required final String? description,
      required final bool uncensored,
      required final String lastUpdateDateTime,
      required final String status}) = _$EpisodeDtoImpl;

  factory _EpisodeDto.fromJson(Map<String, dynamic> json) =
      _$EpisodeDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  String get platform;
  @override
  AnimeDto get anime;
  @override
  String get episodeType;
  @override
  String get langType;
  @override
  String get hash;
  @override
  String get releaseDateTime;
  @override
  int get season;
  @override
  int get number;
  @override
  String? get title;
  @override
  String get url;
  @override
  String get image;
  @override
  int get duration;
  @override
  String? get description;
  @override
  bool get uncensored;
  @override
  String get lastUpdateDateTime;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeDtoImplCopyWith<_$EpisodeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
