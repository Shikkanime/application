// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberDto _$MemberDtoFromJson(Map<String, dynamic> json) {
  return _MemberDto.fromJson(json);
}

/// @nodoc
mixin _$MemberDto {
  String get uuid => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get creationDateTime => throw _privateConstructorUsedError;
  String get lastUpdateDateTime => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<String> get followedAnimes => throw _privateConstructorUsedError;
  List<String> get followedEpisodes => throw _privateConstructorUsedError;
  int get totalDuration => throw _privateConstructorUsedError;
  int get totalUnseenDuration => throw _privateConstructorUsedError;
  bool get hasProfilePicture => throw _privateConstructorUsedError;

  /// Serializes this MemberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberDtoCopyWith<MemberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberDtoCopyWith<$Res> {
  factory $MemberDtoCopyWith(MemberDto value, $Res Function(MemberDto) then) =
      _$MemberDtoCopyWithImpl<$Res, MemberDto>;
  @useResult
  $Res call(
      {String uuid,
      String token,
      String creationDateTime,
      String lastUpdateDateTime,
      bool isPrivate,
      String? email,
      List<String> followedAnimes,
      List<String> followedEpisodes,
      int totalDuration,
      int totalUnseenDuration,
      bool hasProfilePicture});
}

/// @nodoc
class _$MemberDtoCopyWithImpl<$Res, $Val extends MemberDto>
    implements $MemberDtoCopyWith<$Res> {
  _$MemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? token = null,
    Object? creationDateTime = null,
    Object? lastUpdateDateTime = null,
    Object? isPrivate = null,
    Object? email = freezed,
    Object? followedAnimes = null,
    Object? followedEpisodes = null,
    Object? totalDuration = null,
    Object? totalUnseenDuration = null,
    Object? hasProfilePicture = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      creationDateTime: null == creationDateTime
          ? _value.creationDateTime
          : creationDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      followedAnimes: null == followedAnimes
          ? _value.followedAnimes
          : followedAnimes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followedEpisodes: null == followedEpisodes
          ? _value.followedEpisodes
          : followedEpisodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnseenDuration: null == totalUnseenDuration
          ? _value.totalUnseenDuration
          : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
              as int,
      hasProfilePicture: null == hasProfilePicture
          ? _value.hasProfilePicture
          : hasProfilePicture // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberDtoImplCopyWith<$Res>
    implements $MemberDtoCopyWith<$Res> {
  factory _$$MemberDtoImplCopyWith(
          _$MemberDtoImpl value, $Res Function(_$MemberDtoImpl) then) =
      __$$MemberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String token,
      String creationDateTime,
      String lastUpdateDateTime,
      bool isPrivate,
      String? email,
      List<String> followedAnimes,
      List<String> followedEpisodes,
      int totalDuration,
      int totalUnseenDuration,
      bool hasProfilePicture});
}

/// @nodoc
class __$$MemberDtoImplCopyWithImpl<$Res>
    extends _$MemberDtoCopyWithImpl<$Res, _$MemberDtoImpl>
    implements _$$MemberDtoImplCopyWith<$Res> {
  __$$MemberDtoImplCopyWithImpl(
      _$MemberDtoImpl _value, $Res Function(_$MemberDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? token = null,
    Object? creationDateTime = null,
    Object? lastUpdateDateTime = null,
    Object? isPrivate = null,
    Object? email = freezed,
    Object? followedAnimes = null,
    Object? followedEpisodes = null,
    Object? totalDuration = null,
    Object? totalUnseenDuration = null,
    Object? hasProfilePicture = null,
  }) {
    return _then(_$MemberDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      creationDateTime: null == creationDateTime
          ? _value.creationDateTime
          : creationDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdateDateTime: null == lastUpdateDateTime
          ? _value.lastUpdateDateTime
          : lastUpdateDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: null == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      followedAnimes: null == followedAnimes
          ? _value.followedAnimes
          : followedAnimes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followedEpisodes: null == followedEpisodes
          ? _value.followedEpisodes
          : followedEpisodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnseenDuration: null == totalUnseenDuration
          ? _value.totalUnseenDuration
          : totalUnseenDuration // ignore: cast_nullable_to_non_nullable
              as int,
      hasProfilePicture: null == hasProfilePicture
          ? _value.hasProfilePicture
          : hasProfilePicture // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberDtoImpl implements _MemberDto {
  const _$MemberDtoImpl(
      {required this.uuid,
      required this.token,
      required this.creationDateTime,
      required this.lastUpdateDateTime,
      required this.isPrivate,
      required this.email,
      required this.followedAnimes,
      required this.followedEpisodes,
      required this.totalDuration,
      required this.totalUnseenDuration,
      required this.hasProfilePicture});

  factory _$MemberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberDtoImplFromJson(json);

  @override
  final String uuid;
  @override
  final String token;
  @override
  final String creationDateTime;
  @override
  final String lastUpdateDateTime;
  @override
  final bool isPrivate;
  @override
  final String? email;
  @override
  final List<String> followedAnimes;
  @override
  final List<String> followedEpisodes;
  @override
  final int totalDuration;
  @override
  final int totalUnseenDuration;
  @override
  final bool hasProfilePicture;

  @override
  String toString() {
    return 'MemberDto(uuid: $uuid, token: $token, creationDateTime: $creationDateTime, lastUpdateDateTime: $lastUpdateDateTime, isPrivate: $isPrivate, email: $email, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration, totalUnseenDuration: $totalUnseenDuration, hasProfilePicture: $hasProfilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberDtoImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.creationDateTime, creationDateTime) ||
                other.creationDateTime == creationDateTime) &&
            (identical(other.lastUpdateDateTime, lastUpdateDateTime) ||
                other.lastUpdateDateTime == lastUpdateDateTime) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.followedAnimes, followedAnimes) &&
            const DeepCollectionEquality()
                .equals(other.followedEpisodes, followedEpisodes) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.totalUnseenDuration, totalUnseenDuration) ||
                other.totalUnseenDuration == totalUnseenDuration) &&
            (identical(other.hasProfilePicture, hasProfilePicture) ||
                other.hasProfilePicture == hasProfilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      token,
      creationDateTime,
      lastUpdateDateTime,
      isPrivate,
      email,
      const DeepCollectionEquality().hash(followedAnimes),
      const DeepCollectionEquality().hash(followedEpisodes),
      totalDuration,
      totalUnseenDuration,
      hasProfilePicture);

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberDtoImplCopyWith<_$MemberDtoImpl> get copyWith =>
      __$$MemberDtoImplCopyWithImpl<_$MemberDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberDtoImplToJson(
      this,
    );
  }
}

abstract class _MemberDto implements MemberDto {
  const factory _MemberDto(
      {required final String uuid,
      required final String token,
      required final String creationDateTime,
      required final String lastUpdateDateTime,
      required final bool isPrivate,
      required final String? email,
      required final List<String> followedAnimes,
      required final List<String> followedEpisodes,
      required final int totalDuration,
      required final int totalUnseenDuration,
      required final bool hasProfilePicture}) = _$MemberDtoImpl;

  factory _MemberDto.fromJson(Map<String, dynamic> json) =
      _$MemberDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  String get token;
  @override
  String get creationDateTime;
  @override
  String get lastUpdateDateTime;
  @override
  bool get isPrivate;
  @override
  String? get email;
  @override
  List<String> get followedAnimes;
  @override
  List<String> get followedEpisodes;
  @override
  int get totalDuration;
  @override
  int get totalUnseenDuration;
  @override
  bool get hasProfilePicture;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberDtoImplCopyWith<_$MemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
