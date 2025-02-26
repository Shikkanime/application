// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeekDayDto {
  String get dayOfWeek;
  List<WeekDayReleaseDto> get releases;

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeekDayDtoCopyWith<WeekDayDto> get copyWith =>
      _$WeekDayDtoCopyWithImpl<WeekDayDto>(this as WeekDayDto, _$identity);

  /// Serializes this WeekDayDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeekDayDto &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(other.releases, releases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dayOfWeek, const DeepCollectionEquality().hash(releases));

  @override
  String toString() {
    return 'WeekDayDto(dayOfWeek: $dayOfWeek, releases: $releases)';
  }
}

/// @nodoc
abstract mixin class $WeekDayDtoCopyWith<$Res> {
  factory $WeekDayDtoCopyWith(
          WeekDayDto value, $Res Function(WeekDayDto) _then) =
      _$WeekDayDtoCopyWithImpl;
  @useResult
  $Res call({String dayOfWeek, List<WeekDayReleaseDto> releases});
}

/// @nodoc
class _$WeekDayDtoCopyWithImpl<$Res> implements $WeekDayDtoCopyWith<$Res> {
  _$WeekDayDtoCopyWithImpl(this._self, this._then);

  final WeekDayDto _self;
  final $Res Function(WeekDayDto) _then;

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
    Object? releases = null,
  }) {
    return _then(_self.copyWith(
      dayOfWeek: null == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      releases: null == releases
          ? _self.releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<WeekDayReleaseDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeekDayDto implements WeekDayDto {
  const _WeekDayDto(
      {required this.dayOfWeek,
      required final List<WeekDayReleaseDto> releases})
      : _releases = releases;
  factory _WeekDayDto.fromJson(Map<String, dynamic> json) =>
      _$WeekDayDtoFromJson(json);

  @override
  final String dayOfWeek;
  final List<WeekDayReleaseDto> _releases;
  @override
  List<WeekDayReleaseDto> get releases {
    if (_releases is EqualUnmodifiableListView) return _releases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releases);
  }

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeekDayDtoCopyWith<_WeekDayDto> get copyWith =>
      __$WeekDayDtoCopyWithImpl<_WeekDayDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeekDayDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeekDayDto &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(other._releases, _releases));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dayOfWeek, const DeepCollectionEquality().hash(_releases));

  @override
  String toString() {
    return 'WeekDayDto(dayOfWeek: $dayOfWeek, releases: $releases)';
  }
}

/// @nodoc
abstract mixin class _$WeekDayDtoCopyWith<$Res>
    implements $WeekDayDtoCopyWith<$Res> {
  factory _$WeekDayDtoCopyWith(
          _WeekDayDto value, $Res Function(_WeekDayDto) _then) =
      __$WeekDayDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String dayOfWeek, List<WeekDayReleaseDto> releases});
}

/// @nodoc
class __$WeekDayDtoCopyWithImpl<$Res> implements _$WeekDayDtoCopyWith<$Res> {
  __$WeekDayDtoCopyWithImpl(this._self, this._then);

  final _WeekDayDto _self;
  final $Res Function(_WeekDayDto) _then;

  /// Create a copy of WeekDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dayOfWeek = null,
    Object? releases = null,
  }) {
    return _then(_WeekDayDto(
      dayOfWeek: null == dayOfWeek
          ? _self.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      releases: null == releases
          ? _self._releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<WeekDayReleaseDto>,
    ));
  }
}

// dart format on
