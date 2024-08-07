// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pageable_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageableDto _$PageableDtoFromJson(Map<String, dynamic> json) {
  return _PageableDto.fromJson(json);
}

/// @nodoc
mixin _$PageableDto {
  List<dynamic> get data => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PageableDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageableDtoCopyWith<PageableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageableDtoCopyWith<$Res> {
  factory $PageableDtoCopyWith(
          PageableDto value, $Res Function(PageableDto) then) =
      _$PageableDtoCopyWithImpl<$Res, PageableDto>;
  @useResult
  $Res call({List<dynamic> data, int page, int limit, int total});
}

/// @nodoc
class _$PageableDtoCopyWithImpl<$Res, $Val extends PageableDto>
    implements $PageableDtoCopyWith<$Res> {
  _$PageableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageableDtoImplCopyWith<$Res>
    implements $PageableDtoCopyWith<$Res> {
  factory _$$PageableDtoImplCopyWith(
          _$PageableDtoImpl value, $Res Function(_$PageableDtoImpl) then) =
      __$$PageableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> data, int page, int limit, int total});
}

/// @nodoc
class __$$PageableDtoImplCopyWithImpl<$Res>
    extends _$PageableDtoCopyWithImpl<$Res, _$PageableDtoImpl>
    implements _$$PageableDtoImplCopyWith<$Res> {
  __$$PageableDtoImplCopyWithImpl(
      _$PageableDtoImpl _value, $Res Function(_$PageableDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageableDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? page = null,
    Object? limit = null,
    Object? total = null,
  }) {
    return _then(_$PageableDtoImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageableDtoImpl implements _PageableDto {
  const _$PageableDtoImpl(
      {required final List<dynamic> data,
      required this.page,
      required this.limit,
      required this.total})
      : _data = data;

  factory _$PageableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageableDtoImplFromJson(json);

  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;

  @override
  String toString() {
    return 'PageableDto(data: $data, page: $page, limit: $limit, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageableDtoImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), page, limit, total);

  /// Create a copy of PageableDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageableDtoImplCopyWith<_$PageableDtoImpl> get copyWith =>
      __$$PageableDtoImplCopyWithImpl<_$PageableDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageableDtoImplToJson(
      this,
    );
  }
}

abstract class _PageableDto implements PageableDto {
  const factory _PageableDto(
      {required final List<dynamic> data,
      required final int page,
      required final int limit,
      required final int total}) = _$PageableDtoImpl;

  factory _PageableDto.fromJson(Map<String, dynamic> json) =
      _$PageableDtoImpl.fromJson;

  @override
  List<dynamic> get data;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;

  /// Create a copy of PageableDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageableDtoImplCopyWith<_$PageableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
