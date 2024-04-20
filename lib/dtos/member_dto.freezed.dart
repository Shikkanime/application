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
  List<String> get followedAnimes => throw _privateConstructorUsedError;
  List<String> get followedEpisodes => throw _privateConstructorUsedError;
  int get totalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      List<String> followedAnimes,
      List<String> followedEpisodes,
      int totalDuration});
}

/// @nodoc
class _$MemberDtoCopyWithImpl<$Res, $Val extends MemberDto>
    implements $MemberDtoCopyWith<$Res> {
  _$MemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? token = null,
    Object? creationDateTime = null,
    Object? lastUpdateDateTime = null,
    Object? isPrivate = null,
    Object? followedAnimes = null,
    Object? followedEpisodes = null,
    Object? totalDuration = null,
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
      List<String> followedAnimes,
      List<String> followedEpisodes,
      int totalDuration});
}

/// @nodoc
class __$$MemberDtoImplCopyWithImpl<$Res>
    extends _$MemberDtoCopyWithImpl<$Res, _$MemberDtoImpl>
    implements _$$MemberDtoImplCopyWith<$Res> {
  __$$MemberDtoImplCopyWithImpl(
      _$MemberDtoImpl _value, $Res Function(_$MemberDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? token = null,
    Object? creationDateTime = null,
    Object? lastUpdateDateTime = null,
    Object? isPrivate = null,
    Object? followedAnimes = null,
    Object? followedEpisodes = null,
    Object? totalDuration = null,
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
      required this.followedAnimes,
      required this.followedEpisodes,
      required this.totalDuration});

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
  final List<String> followedAnimes;
  @override
  final List<String> followedEpisodes;
  @override
  final int totalDuration;

  @override
  String toString() {
    return 'MemberDto(uuid: $uuid, token: $token, creationDateTime: $creationDateTime, lastUpdateDateTime: $lastUpdateDateTime, isPrivate: $isPrivate, followedAnimes: $followedAnimes, followedEpisodes: $followedEpisodes, totalDuration: $totalDuration)';
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
            const DeepCollectionEquality()
                .equals(other.followedAnimes, followedAnimes) &&
            const DeepCollectionEquality()
                .equals(other.followedEpisodes, followedEpisodes) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      token,
      creationDateTime,
      lastUpdateDateTime,
      isPrivate,
      const DeepCollectionEquality().hash(followedAnimes),
      const DeepCollectionEquality().hash(followedEpisodes),
      totalDuration);

  @JsonKey(ignore: true)
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
      required final List<String> followedAnimes,
      required final List<String> followedEpisodes,
      required final int totalDuration}) = _$MemberDtoImpl;

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
  List<String> get followedAnimes;
  @override
  List<String> get followedEpisodes;
  @override
  int get totalDuration;
  @override
  @JsonKey(ignore: true)
  _$$MemberDtoImplCopyWith<_$MemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}