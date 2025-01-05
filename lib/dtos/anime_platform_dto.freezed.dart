// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_platform_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnimePlatformDto _$AnimePlatformDtoFromJson(Map<String, dynamic> json) {
  return _AnimePlatformDto.fromJson(json);
}

/// @nodoc
mixin _$AnimePlatformDto {
  String get uuid => throw _privateConstructorUsedError;
  PlatformDto get platform => throw _privateConstructorUsedError;
  String get platformId => throw _privateConstructorUsedError;

  /// Serializes this AnimePlatformDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimePlatformDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimePlatformDtoCopyWith<AnimePlatformDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimePlatformDtoCopyWith<$Res> {
  factory $AnimePlatformDtoCopyWith(
          AnimePlatformDto value, $Res Function(AnimePlatformDto) then) =
      _$AnimePlatformDtoCopyWithImpl<$Res, AnimePlatformDto>;
  @useResult
  $Res call({String uuid, PlatformDto platform, String platformId});

  $PlatformDtoCopyWith<$Res> get platform;
}

/// @nodoc
class _$AnimePlatformDtoCopyWithImpl<$Res, $Val extends AnimePlatformDto>
    implements $AnimePlatformDtoCopyWith<$Res> {
  _$AnimePlatformDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimePlatformDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? platform = null,
    Object? platformId = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformDto,
      platformId: null == platformId
          ? _value.platformId
          : platformId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AnimePlatformDto
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
abstract class _$$AnimePlatformDtoImplCopyWith<$Res>
    implements $AnimePlatformDtoCopyWith<$Res> {
  factory _$$AnimePlatformDtoImplCopyWith(_$AnimePlatformDtoImpl value,
          $Res Function(_$AnimePlatformDtoImpl) then) =
      __$$AnimePlatformDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, PlatformDto platform, String platformId});

  @override
  $PlatformDtoCopyWith<$Res> get platform;
}

/// @nodoc
class __$$AnimePlatformDtoImplCopyWithImpl<$Res>
    extends _$AnimePlatformDtoCopyWithImpl<$Res, _$AnimePlatformDtoImpl>
    implements _$$AnimePlatformDtoImplCopyWith<$Res> {
  __$$AnimePlatformDtoImplCopyWithImpl(_$AnimePlatformDtoImpl _value,
      $Res Function(_$AnimePlatformDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimePlatformDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? platform = null,
    Object? platformId = null,
  }) {
    return _then(_$AnimePlatformDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformDto,
      platformId: null == platformId
          ? _value.platformId
          : platformId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimePlatformDtoImpl implements _AnimePlatformDto {
  const _$AnimePlatformDtoImpl(
      {required this.uuid, required this.platform, required this.platformId});

  factory _$AnimePlatformDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimePlatformDtoImplFromJson(json);

  @override
  final String uuid;
  @override
  final PlatformDto platform;
  @override
  final String platformId;

  @override
  String toString() {
    return 'AnimePlatformDto(uuid: $uuid, platform: $platform, platformId: $platformId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimePlatformDtoImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.platformId, platformId) ||
                other.platformId == platformId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, platform, platformId);

  /// Create a copy of AnimePlatformDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimePlatformDtoImplCopyWith<_$AnimePlatformDtoImpl> get copyWith =>
      __$$AnimePlatformDtoImplCopyWithImpl<_$AnimePlatformDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimePlatformDtoImplToJson(
      this,
    );
  }
}

abstract class _AnimePlatformDto implements AnimePlatformDto {
  const factory _AnimePlatformDto(
      {required final String uuid,
      required final PlatformDto platform,
      required final String platformId}) = _$AnimePlatformDtoImpl;

  factory _AnimePlatformDto.fromJson(Map<String, dynamic> json) =
      _$AnimePlatformDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  PlatformDto get platform;
  @override
  String get platformId;

  /// Create a copy of AnimePlatformDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimePlatformDtoImplCopyWith<_$AnimePlatformDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
