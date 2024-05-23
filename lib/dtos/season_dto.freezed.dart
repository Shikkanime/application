// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeasonDto _$SeasonDtoFromJson(Map<String, dynamic> json) {
  return _SeasonDto.fromJson(json);
}

/// @nodoc
mixin _$SeasonDto {
  int get number => throw _privateConstructorUsedError;
  String get lastReleaseDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonDtoCopyWith<SeasonDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonDtoCopyWith<$Res> {
  factory $SeasonDtoCopyWith(SeasonDto value, $Res Function(SeasonDto) then) =
      _$SeasonDtoCopyWithImpl<$Res, SeasonDto>;
  @useResult
  $Res call({int number, String lastReleaseDateTime});
}

/// @nodoc
class _$SeasonDtoCopyWithImpl<$Res, $Val extends SeasonDto>
    implements $SeasonDtoCopyWith<$Res> {
  _$SeasonDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? lastReleaseDateTime = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _value.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonDtoImplCopyWith<$Res>
    implements $SeasonDtoCopyWith<$Res> {
  factory _$$SeasonDtoImplCopyWith(
          _$SeasonDtoImpl value, $Res Function(_$SeasonDtoImpl) then) =
      __$$SeasonDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number, String lastReleaseDateTime});
}

/// @nodoc
class __$$SeasonDtoImplCopyWithImpl<$Res>
    extends _$SeasonDtoCopyWithImpl<$Res, _$SeasonDtoImpl>
    implements _$$SeasonDtoImplCopyWith<$Res> {
  __$$SeasonDtoImplCopyWithImpl(
      _$SeasonDtoImpl _value, $Res Function(_$SeasonDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? lastReleaseDateTime = null,
  }) {
    return _then(_$SeasonDtoImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _value.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonDtoImpl implements _SeasonDto {
  const _$SeasonDtoImpl(
      {required this.number, required this.lastReleaseDateTime});

  factory _$SeasonDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonDtoImplFromJson(json);

  @override
  final int number;
  @override
  final String lastReleaseDateTime;

  @override
  String toString() {
    return 'SeasonDto(number: $number, lastReleaseDateTime: $lastReleaseDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonDtoImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.lastReleaseDateTime, lastReleaseDateTime) ||
                other.lastReleaseDateTime == lastReleaseDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, lastReleaseDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonDtoImplCopyWith<_$SeasonDtoImpl> get copyWith =>
      __$$SeasonDtoImplCopyWithImpl<_$SeasonDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonDtoImplToJson(
      this,
    );
  }
}

abstract class _SeasonDto implements SeasonDto {
  const factory _SeasonDto(
      {required final int number,
      required final String lastReleaseDateTime}) = _$SeasonDtoImpl;

  factory _SeasonDto.fromJson(Map<String, dynamic> json) =
      _$SeasonDtoImpl.fromJson;

  @override
  int get number;
  @override
  String get lastReleaseDateTime;
  @override
  @JsonKey(ignore: true)
  _$$SeasonDtoImplCopyWith<_$SeasonDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
