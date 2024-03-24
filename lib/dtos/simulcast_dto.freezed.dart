// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simulcast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SimulcastDto _$SimulcastDtoFromJson(Map<String, dynamic> json) {
  return _SimulcastDto.fromJson(json);
}

/// @nodoc
mixin _$SimulcastDto {
  String get uuid => throw _privateConstructorUsedError;
  String get season => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimulcastDtoCopyWith<SimulcastDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimulcastDtoCopyWith<$Res> {
  factory $SimulcastDtoCopyWith(
          SimulcastDto value, $Res Function(SimulcastDto) then) =
      _$SimulcastDtoCopyWithImpl<$Res, SimulcastDto>;
  @useResult
  $Res call({String uuid, String season, int year, String slug, String label});
}

/// @nodoc
class _$SimulcastDtoCopyWithImpl<$Res, $Val extends SimulcastDto>
    implements $SimulcastDtoCopyWith<$Res> {
  _$SimulcastDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? season = null,
    Object? year = null,
    Object? slug = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimulcastDtoImplCopyWith<$Res>
    implements $SimulcastDtoCopyWith<$Res> {
  factory _$$SimulcastDtoImplCopyWith(
          _$SimulcastDtoImpl value, $Res Function(_$SimulcastDtoImpl) then) =
      __$$SimulcastDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String season, int year, String slug, String label});
}

/// @nodoc
class __$$SimulcastDtoImplCopyWithImpl<$Res>
    extends _$SimulcastDtoCopyWithImpl<$Res, _$SimulcastDtoImpl>
    implements _$$SimulcastDtoImplCopyWith<$Res> {
  __$$SimulcastDtoImplCopyWithImpl(
      _$SimulcastDtoImpl _value, $Res Function(_$SimulcastDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? season = null,
    Object? year = null,
    Object? slug = null,
    Object? label = null,
  }) {
    return _then(_$SimulcastDtoImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimulcastDtoImpl implements _SimulcastDto {
  const _$SimulcastDtoImpl(
      {required this.uuid,
      required this.season,
      required this.year,
      required this.slug,
      required this.label});

  factory _$SimulcastDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimulcastDtoImplFromJson(json);

  @override
  final String uuid;
  @override
  final String season;
  @override
  final int year;
  @override
  final String slug;
  @override
  final String label;

  @override
  String toString() {
    return 'SimulcastDto(uuid: $uuid, season: $season, year: $year, slug: $slug, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimulcastDtoImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, season, year, slug, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimulcastDtoImplCopyWith<_$SimulcastDtoImpl> get copyWith =>
      __$$SimulcastDtoImplCopyWithImpl<_$SimulcastDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimulcastDtoImplToJson(
      this,
    );
  }
}

abstract class _SimulcastDto implements SimulcastDto {
  const factory _SimulcastDto(
      {required final String uuid,
      required final String season,
      required final int year,
      required final String slug,
      required final String label}) = _$SimulcastDtoImpl;

  factory _SimulcastDto.fromJson(Map<String, dynamic> json) =
      _$SimulcastDtoImpl.fromJson;

  @override
  String get uuid;
  @override
  String get season;
  @override
  int get year;
  @override
  String get slug;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$SimulcastDtoImplCopyWith<_$SimulcastDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
