// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeekDayDto _$WeekDayDtoFromJson(Map<String, dynamic> json) {
  return _WeekDayDto.fromJson(json);
}

/// @nodoc
mixin _$WeekDayDto {
  String get dayOfWeek => throw _privateConstructorUsedError;
  List<WeekDayReleaseDto> get releases => throw _privateConstructorUsedError;

  /// Serializes this WeekDayDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekDayDtoCopyWith<WeekDayDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekDayDtoCopyWith<$Res> {
  factory $WeekDayDtoCopyWith(
          WeekDayDto value, $Res Function(WeekDayDto) then) =
      _$WeekDayDtoCopyWithImpl<$Res, WeekDayDto>;
  @useResult
  $Res call({String dayOfWeek, List<WeekDayReleaseDto> releases});
}

/// @nodoc
class _$WeekDayDtoCopyWithImpl<$Res, $Val extends WeekDayDto>
    implements $WeekDayDtoCopyWith<$Res> {
  _$WeekDayDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? releases = null,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      releases: null == releases
          ? _value.releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<WeekDayReleaseDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekDayDtoImplCopyWith<$Res>
    implements $WeekDayDtoCopyWith<$Res> {
  factory _$$WeekDayDtoImplCopyWith(
          _$WeekDayDtoImpl value, $Res Function(_$WeekDayDtoImpl) then) =
      __$$WeekDayDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String dayOfWeek, List<WeekDayReleaseDto> releases});
}

/// @nodoc
class __$$WeekDayDtoImplCopyWithImpl<$Res>
    extends _$WeekDayDtoCopyWithImpl<$Res, _$WeekDayDtoImpl>
    implements _$$WeekDayDtoImplCopyWith<$Res> {
  __$$WeekDayDtoImplCopyWithImpl(
      _$WeekDayDtoImpl _value, $Res Function(_$WeekDayDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? releases = null,
  }) {
    return _then(_$WeekDayDtoImpl(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      releases: null == releases
          ? _value._releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<WeekDayReleaseDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekDayDtoImpl implements _WeekDayDto {
  const _$WeekDayDtoImpl(
      {required this.dayOfWeek,
      required final List<WeekDayReleaseDto> releases})
      : _releases = releases;

  factory _$WeekDayDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekDayDtoImplFromJson(json);

  @override
  final String dayOfWeek;
  final List<WeekDayReleaseDto> _releases;
  @override
  List<WeekDayReleaseDto> get releases {
    if (_releases is EqualUnmodifiableListView) return _releases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releases);
  }

  @override
  String toString() {
    return 'WeekDayDto(dayOfWeek: $dayOfWeek, releases: $releases)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekDayDtoImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(other._releases, _releases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dayOfWeek, const DeepCollectionEquality().hash(_releases));

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekDayDtoImplCopyWith<_$WeekDayDtoImpl> get copyWith =>
      __$$WeekDayDtoImplCopyWithImpl<_$WeekDayDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekDayDtoImplToJson(
      this,
    );
  }
}

abstract class _WeekDayDto implements WeekDayDto {
  const factory _WeekDayDto(
      {required final String dayOfWeek,
      required final List<WeekDayReleaseDto> releases}) = _$WeekDayDtoImpl;

  factory _WeekDayDto.fromJson(Map<String, dynamic> json) =
      _$WeekDayDtoImpl.fromJson;

  @override
  String get dayOfWeek;
  @override
  List<WeekDayReleaseDto> get releases;

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekDayDtoImplCopyWith<_$WeekDayDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
