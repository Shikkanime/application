// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'missed_anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MissedAnimeDto _$MissedAnimeDtoFromJson(Map<String, dynamic> json) {
  return _MissedAnimeDto.fromJson(json);
}

/// @nodoc
mixin _$MissedAnimeDto {
  AnimeDto get anime => throw _privateConstructorUsedError;
  int get episodeMissed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissedAnimeDtoCopyWith<MissedAnimeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissedAnimeDtoCopyWith<$Res> {
  factory $MissedAnimeDtoCopyWith(
          MissedAnimeDto value, $Res Function(MissedAnimeDto) then) =
      _$MissedAnimeDtoCopyWithImpl<$Res, MissedAnimeDto>;
  @useResult
  $Res call({AnimeDto anime, int episodeMissed});

  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class _$MissedAnimeDtoCopyWithImpl<$Res, $Val extends MissedAnimeDto>
    implements $MissedAnimeDtoCopyWith<$Res> {
  _$MissedAnimeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? episodeMissed = null,
  }) {
    return _then(_value.copyWith(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      episodeMissed: null == episodeMissed
          ? _value.episodeMissed
          : episodeMissed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeDtoCopyWith<$Res> get anime {
    return $AnimeDtoCopyWith<$Res>(_value.anime, (value) {
      return _then(_value.copyWith(anime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MissedAnimeDtoImplCopyWith<$Res>
    implements $MissedAnimeDtoCopyWith<$Res> {
  factory _$$MissedAnimeDtoImplCopyWith(_$MissedAnimeDtoImpl value,
          $Res Function(_$MissedAnimeDtoImpl) then) =
      __$$MissedAnimeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AnimeDto anime, int episodeMissed});

  @override
  $AnimeDtoCopyWith<$Res> get anime;
}

/// @nodoc
class __$$MissedAnimeDtoImplCopyWithImpl<$Res>
    extends _$MissedAnimeDtoCopyWithImpl<$Res, _$MissedAnimeDtoImpl>
    implements _$$MissedAnimeDtoImplCopyWith<$Res> {
  __$$MissedAnimeDtoImplCopyWithImpl(
      _$MissedAnimeDtoImpl _value, $Res Function(_$MissedAnimeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? episodeMissed = null,
  }) {
    return _then(_$MissedAnimeDtoImpl(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      episodeMissed: null == episodeMissed
          ? _value.episodeMissed
          : episodeMissed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissedAnimeDtoImpl implements _MissedAnimeDto {
  const _$MissedAnimeDtoImpl(
      {required this.anime, required this.episodeMissed});

  factory _$MissedAnimeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissedAnimeDtoImplFromJson(json);

  @override
  final AnimeDto anime;
  @override
  final int episodeMissed;

  @override
  String toString() {
    return 'MissedAnimeDto(anime: $anime, episodeMissed: $episodeMissed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissedAnimeDtoImpl &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.episodeMissed, episodeMissed) ||
                other.episodeMissed == episodeMissed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, anime, episodeMissed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissedAnimeDtoImplCopyWith<_$MissedAnimeDtoImpl> get copyWith =>
      __$$MissedAnimeDtoImplCopyWithImpl<_$MissedAnimeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissedAnimeDtoImplToJson(
      this,
    );
  }
}

abstract class _MissedAnimeDto implements MissedAnimeDto {
  const factory _MissedAnimeDto(
      {required final AnimeDto anime,
      required final int episodeMissed}) = _$MissedAnimeDtoImpl;

  factory _MissedAnimeDto.fromJson(Map<String, dynamic> json) =
      _$MissedAnimeDtoImpl.fromJson;

  @override
  AnimeDto get anime;
  @override
  int get episodeMissed;
  @override
  @JsonKey(ignore: true)
  _$$MissedAnimeDtoImplCopyWith<_$MissedAnimeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
