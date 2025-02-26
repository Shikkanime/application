// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_variant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeVariantDto {
  String get uuid;
  String get releaseDateTime;
  PlatformDto get platform;
  String get audioLocale;
  String get identifier;
  String get url;
  bool get uncensored;

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EpisodeVariantDtoCopyWith<EpisodeVariantDto> get copyWith =>
      _$EpisodeVariantDtoCopyWithImpl<EpisodeVariantDto>(
          this as EpisodeVariantDto, _$identity);

  /// Serializes this EpisodeVariantDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EpisodeVariantDto &&
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

  @override
  String toString() {
    return 'EpisodeVariantDto(uuid: $uuid, releaseDateTime: $releaseDateTime, platform: $platform, audioLocale: $audioLocale, identifier: $identifier, url: $url, uncensored: $uncensored)';
  }
}

/// @nodoc
abstract mixin class $EpisodeVariantDtoCopyWith<$Res> {
  factory $EpisodeVariantDtoCopyWith(
          EpisodeVariantDto value, $Res Function(EpisodeVariantDto) _then) =
      _$EpisodeVariantDtoCopyWithImpl;
  @useResult
  $Res call(
      {String uuid,
      String releaseDateTime,
      PlatformDto platform,
      String audioLocale,
      String identifier,
      String url,
      bool uncensored});
}

/// @nodoc
class _$EpisodeVariantDtoCopyWithImpl<$Res>
    implements $EpisodeVariantDtoCopyWith<$Res> {
  _$EpisodeVariantDtoCopyWithImpl(this._self, this._then);

  final EpisodeVariantDto _self;
  final $Res Function(EpisodeVariantDto) _then;

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
    return _then(_self.copyWith(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _self.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformDto,
      audioLocale: null == audioLocale
          ? _self.audioLocale
          : audioLocale // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uncensored: null == uncensored
          ? _self.uncensored
          : uncensored // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EpisodeVariantDto implements EpisodeVariantDto {
  const _EpisodeVariantDto(
      {required this.uuid,
      required this.releaseDateTime,
      required this.platform,
      required this.audioLocale,
      required this.identifier,
      required this.url,
      required this.uncensored});
  factory _EpisodeVariantDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeVariantDtoFromJson(json);

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

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EpisodeVariantDtoCopyWith<_EpisodeVariantDto> get copyWith =>
      __$EpisodeVariantDtoCopyWithImpl<_EpisodeVariantDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EpisodeVariantDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EpisodeVariantDto &&
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

  @override
  String toString() {
    return 'EpisodeVariantDto(uuid: $uuid, releaseDateTime: $releaseDateTime, platform: $platform, audioLocale: $audioLocale, identifier: $identifier, url: $url, uncensored: $uncensored)';
  }
}

/// @nodoc
abstract mixin class _$EpisodeVariantDtoCopyWith<$Res>
    implements $EpisodeVariantDtoCopyWith<$Res> {
  factory _$EpisodeVariantDtoCopyWith(
          _EpisodeVariantDto value, $Res Function(_EpisodeVariantDto) _then) =
      __$EpisodeVariantDtoCopyWithImpl;
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
}

/// @nodoc
class __$EpisodeVariantDtoCopyWithImpl<$Res>
    implements _$EpisodeVariantDtoCopyWith<$Res> {
  __$EpisodeVariantDtoCopyWithImpl(this._self, this._then);

  final _EpisodeVariantDto _self;
  final $Res Function(_EpisodeVariantDto) _then;

  /// Create a copy of EpisodeVariantDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uuid = null,
    Object? releaseDateTime = null,
    Object? platform = null,
    Object? audioLocale = null,
    Object? identifier = null,
    Object? url = null,
    Object? uncensored = null,
  }) {
    return _then(_EpisodeVariantDto(
      uuid: null == uuid
          ? _self.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDateTime: null == releaseDateTime
          ? _self.releaseDateTime
          : releaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _self.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformDto,
      audioLocale: null == audioLocale
          ? _self.audioLocale
          : audioLocale // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _self.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      uncensored: null == uncensored
          ? _self.uncensored
          : uncensored // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
