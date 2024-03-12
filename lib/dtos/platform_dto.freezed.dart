// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlatformDto _$PlatformDtoFromJson(Map<String, dynamic> json) {
  return _PlatformDto.fromJson(json);
}

/// @nodoc
mixin _$PlatformDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlatformDtoCopyWith<PlatformDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformDtoCopyWith<$Res> {
  factory $PlatformDtoCopyWith(
          PlatformDto value, $Res Function(PlatformDto) then) =
      _$PlatformDtoCopyWithImpl<$Res, PlatformDto>;
  @useResult
  $Res call({String id, String name, String url, String image});
}

/// @nodoc
class _$PlatformDtoCopyWithImpl<$Res, $Val extends PlatformDto>
    implements $PlatformDtoCopyWith<$Res> {
  _$PlatformDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformDtoImplCopyWith<$Res>
    implements $PlatformDtoCopyWith<$Res> {
  factory _$$PlatformDtoImplCopyWith(
          _$PlatformDtoImpl value, $Res Function(_$PlatformDtoImpl) then) =
      __$$PlatformDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String url, String image});
}

/// @nodoc
class __$$PlatformDtoImplCopyWithImpl<$Res>
    extends _$PlatformDtoCopyWithImpl<$Res, _$PlatformDtoImpl>
    implements _$$PlatformDtoImplCopyWith<$Res> {
  __$$PlatformDtoImplCopyWithImpl(
      _$PlatformDtoImpl _value, $Res Function(_$PlatformDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
    Object? image = null,
  }) {
    return _then(_$PlatformDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformDtoImpl implements _PlatformDto {
  const _$PlatformDtoImpl(
      {required this.id,
      required this.name,
      required this.url,
      required this.image});

  factory _$PlatformDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final String image;

  @override
  String toString() {
    return 'PlatformDto(id: $id, name: $name, url: $url, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformDtoImplCopyWith<_$PlatformDtoImpl> get copyWith =>
      __$$PlatformDtoImplCopyWithImpl<_$PlatformDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformDtoImplToJson(
      this,
    );
  }
}

abstract class _PlatformDto implements PlatformDto {
  const factory _PlatformDto(
      {required final String id,
      required final String name,
      required final String url,
      required final String image}) = _$PlatformDtoImpl;

  factory _PlatformDto.fromJson(Map<String, dynamic> json) =
      _$PlatformDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get url;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$PlatformDtoImplCopyWith<_$PlatformDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
