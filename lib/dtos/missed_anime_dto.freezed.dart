// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'missed_anime_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MissedAnimeDto {
  AnimeDto get anime;
  int get episodeMissed;

  /// Create a copy of MissedAnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MissedAnimeDtoCopyWith<MissedAnimeDto> get copyWith =>
      _$MissedAnimeDtoCopyWithImpl<MissedAnimeDto>(
          this as MissedAnimeDto, _$identity);

  /// Serializes this MissedAnimeDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MissedAnimeDto &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.episodeMissed, episodeMissed) ||
                other.episodeMissed == episodeMissed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, anime, episodeMissed);

  @override
  String toString() {
    return 'MissedAnimeDto(anime: $anime, episodeMissed: $episodeMissed)';
  }
}

/// @nodoc
abstract mixin class $MissedAnimeDtoCopyWith<$Res> {
  factory $MissedAnimeDtoCopyWith(
          MissedAnimeDto value, $Res Function(MissedAnimeDto) _then) =
      _$MissedAnimeDtoCopyWithImpl;
  @useResult
  $Res call({AnimeDto anime, int episodeMissed});
}

/// @nodoc
class _$MissedAnimeDtoCopyWithImpl<$Res>
    implements $MissedAnimeDtoCopyWith<$Res> {
  _$MissedAnimeDtoCopyWithImpl(this._self, this._then);

  final MissedAnimeDto _self;
  final $Res Function(MissedAnimeDto) _then;

  /// Create a copy of MissedAnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? episodeMissed = null,
  }) {
    return _then(_self.copyWith(
      anime: null == anime
          ? _self.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      episodeMissed: null == episodeMissed
          ? _self.episodeMissed
          : episodeMissed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MissedAnimeDto implements MissedAnimeDto {
  const _MissedAnimeDto({required this.anime, required this.episodeMissed});
  factory _MissedAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$MissedAnimeDtoFromJson(json);

  @override
  final AnimeDto anime;
  @override
  final int episodeMissed;

  /// Create a copy of MissedAnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissedAnimeDtoCopyWith<_MissedAnimeDto> get copyWith =>
      __$MissedAnimeDtoCopyWithImpl<_MissedAnimeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissedAnimeDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissedAnimeDto &&
            (identical(other.anime, anime) || other.anime == anime) &&
            (identical(other.episodeMissed, episodeMissed) ||
                other.episodeMissed == episodeMissed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, anime, episodeMissed);

  @override
  String toString() {
    return 'MissedAnimeDto(anime: $anime, episodeMissed: $episodeMissed)';
  }
}

/// @nodoc
abstract mixin class _$MissedAnimeDtoCopyWith<$Res>
    implements $MissedAnimeDtoCopyWith<$Res> {
  factory _$MissedAnimeDtoCopyWith(
          _MissedAnimeDto value, $Res Function(_MissedAnimeDto) _then) =
      __$MissedAnimeDtoCopyWithImpl;
  @override
  @useResult
  $Res call({AnimeDto anime, int episodeMissed});
}

/// @nodoc
class __$MissedAnimeDtoCopyWithImpl<$Res>
    implements _$MissedAnimeDtoCopyWith<$Res> {
  __$MissedAnimeDtoCopyWithImpl(this._self, this._then);

  final _MissedAnimeDto _self;
  final $Res Function(_MissedAnimeDto) _then;

  /// Create a copy of MissedAnimeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? anime = null,
    Object? episodeMissed = null,
  }) {
    return _then(_MissedAnimeDto(
      anime: null == anime
          ? _self.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeDto,
      episodeMissed: null == episodeMissed
          ? _self.episodeMissed
          : episodeMissed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
