// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_variant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpisodeVariantDto _$EpisodeVariantDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeVariantDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeVariantDto {
  String get uuid => throw _privateConstructorUsedError;
  String get releaseDateTime => throw _privateConstructorUsedError;
  PlatformDto get platform => throw _privateConstructorUsedError;
  String get audioLocale => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get uncensored => throw _privateConstructorUsedError;

  /// Serializes this EpisodeVariantDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeVariantDtoCopyWith<EpisodeVariantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeVariantDtoCopyWith<$Res> {
  factory $EpisodeVariantDtoCopyWith(
          EpisodeVariantDto value, $Res Function(EpisodeVariantDto) then) =
      _$EpisodeVariantDtoCopyWithImpl<$Res, EpisodeVariantDto>;
  @useResult
  $Res call(
      {String uuid,
      String releaseDateTime,
      PlatformDto platform,
      String audioLocale,
      String identifier,
      String url,
      bool uncensored});

  $PlatformDtoCopyWith<$Res> get platform;
}

/// @nodoc
class _$EpisodeVariantDtoCopyWithImpl<$Res, $Val extends EpisodeVariantDto>
    implements $EpisodeVariantDtoCopyWith<$Res> {
  _$EpisodeVariantDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? releaseDateTime = null,
    Object? platform = null,
    Object? audioLocale = null,
    Object? identifier = null,
    Object? url = null,
    Object? uncensored = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformDto,
      audioLocale: null == audioLocale
          ? _value.audioLocale
          : audioLocale // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uncensored: null == uncensored
          ? _value.uncensored
          : uncensored // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformDtoCopyWith<$Res> get platform {
    return $PlatformDtoCopyWith<$Res>(_value.platform, (value) {
      return _then(_value.copyWith(platform: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeVariantDtoImplCopyWith<$Res>
    implements $EpisodeVariantDtoCopyWith<$Res> {
  factory _$$EpisodeVariantDtoImplCopyWith(_$EpisodeVariantDtoImpl value,
          $Res Function(_$EpisodeVariantDtoImpl) then) =
      __$$EpisodeVariantDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String releaseDateTime,
      PlatformDto platform,
      String audioLocale,
      String identifier,
      String url,
      bool uncensored});

  @override
  $PlatformDtoCopyWith<$Res> get platform;
}

/// @nodoc
class __$$EpisodeVariantDtoImplCopyWithImpl<$Res>
    extends _$EpisodeVariantDtoCopyWithImpl<$Res, _$EpisodeVariantDtoImpl>
    implements _$$EpisodeVariantDtoImplCopyWith<$Res> {
  __$$EpisodeVariantDtoImplCopyWithImpl(_$EpisodeVariantDtoImpl _value,
      $Res Function(_$EpisodeVariantDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? releaseDateTime = null,
    Object? platform = null,
    Object? audioLocale = null,
    Object? identifier = null,
    Object? url = null,
    Object? uncensored = null,
  }) {
    return _then(_$EpisodeVariantDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _value.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformDto,
      audioLocale: null == audioLocale
          ? _value.audioLocale
          : audioLocale // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uncensored: null == uncensored
          ? _value.uncensored
          : uncensored // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeVariantDtoImpl implements _EpisodeVariantDto {
  const _$EpisodeVariantDtoImpl(
      {required this.uuid,
      required this.releaseDateTime,
      required this.platform,
      required this.audioLocale,
      required this.identifier,
      required this.url,
      required this.uncensored});

  factory _$EpisodeVariantDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeVariantDtoImplFromJson(json);

  @override
  final String uuid;
  @override
  final String releaseDateTime;
  @override
  final PlatformDto platform;
  @override
  final String audioLocale;
  @override
  final String identifier;
  @override
  final String url;
  @override
  final bool uncensored;

  @override
  String toString() {
    return 'EpisodeVariantDto(uuid: $uuid, releaseDateTime: $releaseDateTime, platform: $platform, audioLocale: $audioLocale, identifier: $identifier, url: $url, uncensored: $uncensored)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeVariantDtoImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.releaseDateTime, releaseDateTime) ||
                other.releaseDateTime == releaseDateTime) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.audioLocale, audioLocale) ||
                other.audioLocale == audioLocale) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.uncensored, uncensored) ||
                other.uncensored == uncensored));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, releaseDateTime, platform,
      audioLocale, identifier, url, uncensored);

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeVariantDtoImplCopyWith<_$EpisodeVariantDtoImpl> get copyWith =>
      __$$EpisodeVariantDtoImplCopyWithImpl<_$EpisodeVariantDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeVariantDtoImplToJson(
      this,
    );
  }
}

abstract class _EpisodeVariantDto implements EpisodeVariantDto {
  const factory _EpisodeVariantDto(
      {required final String uuid,
      required final String releaseDateTime,
      required final PlatformDto platform,
      required final String audioLocale,
      required final String identifier,
      required final String url,
      required final bool uncensored}) = _$EpisodeVariantDtoImpl;

  factory _EpisodeVariantDto.fromJson(Map<String, dynamic> json) =
      _$EpisodeVariantDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  String get releaseDateTime;
  @override
  PlatformDto get platform;
  @override
  String get audioLocale;
  @override
  String get identifier;
  @override
  String get url;
  @override
  bool get uncensored;

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeVariantDtoImplCopyWith<_$EpisodeVariantDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
