// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonDto {
  int get number;
  String get lastReleaseDateTime;

  /// Create a copy of SeasonDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeasonDtoCopyWith<SeasonDto> get copyWith =>
      _$SeasonDtoCopyWithImpl<SeasonDto>(this as SeasonDto, _$identity);

  /// Serializes this SeasonDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeasonDto &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.lastReleaseDateTime, lastReleaseDateTime) ||
                other.lastReleaseDateTime == lastReleaseDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, lastReleaseDateTime);

  @override
  String toString() {
    return 'SeasonDto(number: $number, lastReleaseDateTime: $lastReleaseDateTime)';
  }
}

/// @nodoc
abstract mixin class $SeasonDtoCopyWith<$Res> {
  factory $SeasonDtoCopyWith(SeasonDto value, $Res Function(SeasonDto) _then) =
      _$SeasonDtoCopyWithImpl;
  @useResult
  $Res call({int number, String lastReleaseDateTime});
}

/// @nodoc
class _$SeasonDtoCopyWithImpl<$Res> implements $SeasonDtoCopyWith<$Res> {
  _$SeasonDtoCopyWithImpl(this._self, this._then);

  final SeasonDto _self;
  final $Res Function(SeasonDto) _then;

  /// Create a copy of SeasonDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? lastReleaseDateTime = null,
  }) {
    return _then(_self.copyWith(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _self.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SeasonDto implements SeasonDto {
  const _SeasonDto({required this.number, required this.lastReleaseDateTime});
  factory _SeasonDto.fromJson(Map<String, dynamic> json) =>
      _$SeasonDtoFromJson(json);

  @override
  final int number;
  @override
  final String lastReleaseDateTime;

  /// Create a copy of SeasonDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SeasonDtoCopyWith<_SeasonDto> get copyWith =>
      __$SeasonDtoCopyWithImpl<_SeasonDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SeasonDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SeasonDto &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.lastReleaseDateTime, lastReleaseDateTime) ||
                other.lastReleaseDateTime == lastReleaseDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, lastReleaseDateTime);

  @override
  String toString() {
    return 'SeasonDto(number: $number, lastReleaseDateTime: $lastReleaseDateTime)';
  }
}

/// @nodoc
abstract mixin class _$SeasonDtoCopyWith<$Res>
    implements $SeasonDtoCopyWith<$Res> {
  factory _$SeasonDtoCopyWith(
          _SeasonDto value, $Res Function(_SeasonDto) _then) =
      __$SeasonDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int number, String lastReleaseDateTime});
}

/// @nodoc
class __$SeasonDtoCopyWithImpl<$Res> implements _$SeasonDtoCopyWith<$Res> {
  __$SeasonDtoCopyWithImpl(this._self, this._then);

  final _SeasonDto _self;
  final $Res Function(_SeasonDto) _then;

  /// Create a copy of SeasonDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? lastReleaseDateTime = null,
  }) {
    return _then(_SeasonDto(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      lastReleaseDateTime: null == lastReleaseDateTime
          ? _self.lastReleaseDateTime
          : lastReleaseDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
