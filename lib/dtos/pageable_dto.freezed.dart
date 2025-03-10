// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pageable_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageableDto {

 List<dynamic> get data; int get page; int get limit; int get total;
/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<PageableDto> get copyWith => _$PageableDtoCopyWithImpl<PageableDto>(this as PageableDto, _$identity);

  /// Serializes this PageableDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageableDto&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),page,limit,total);

@override
String toString() {
  return 'PageableDto(data: $data, page: $page, limit: $limit, total: $total)';
}


}

/// @nodoc
abstract mixin class $PageableDtoCopyWith<$Res>  {
  factory $PageableDtoCopyWith(PageableDto value, $Res Function(PageableDto) _then) = _$PageableDtoCopyWithImpl;
@useResult
$Res call({
 List<dynamic> data, int page, int limit, int total
});




}
/// @nodoc
class _$PageableDtoCopyWithImpl<$Res>
    implements $PageableDtoCopyWith<$Res> {
  _$PageableDtoCopyWithImpl(this._self, this._then);

  final PageableDto _self;
  final $Res Function(PageableDto) _then;

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? page = null,Object? limit = null,Object? total = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PageableDto implements PageableDto {
  const _PageableDto({required final  List<dynamic> data, required this.page, required this.limit, required this.total}): _data = data;
  factory _PageableDto.fromJson(Map<String, dynamic> json) => _$PageableDtoFromJson(json);

 final  List<dynamic> _data;
@override List<dynamic> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int page;
@override final  int limit;
@override final  int total;

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageableDtoCopyWith<_PageableDto> get copyWith => __$PageableDtoCopyWithImpl<_PageableDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageableDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageableDto&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),page,limit,total);

@override
String toString() {
  return 'PageableDto(data: $data, page: $page, limit: $limit, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PageableDtoCopyWith<$Res> implements $PageableDtoCopyWith<$Res> {
  factory _$PageableDtoCopyWith(_PageableDto value, $Res Function(_PageableDto) _then) = __$PageableDtoCopyWithImpl;
@override @useResult
$Res call({
 List<dynamic> data, int page, int limit, int total
});




}
/// @nodoc
class __$PageableDtoCopyWithImpl<$Res>
    implements _$PageableDtoCopyWith<$Res> {
  __$PageableDtoCopyWithImpl(this._self, this._then);

  final _PageableDto _self;
  final $Res Function(_PageableDto) _then;

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? page = null,Object? limit = null,Object? total = null,}) {
  return _then(_PageableDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<dynamic>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
