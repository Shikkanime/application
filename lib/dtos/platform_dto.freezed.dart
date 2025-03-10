// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlatformDto {

 String get id; String get name; String get url; String get image;
/// Create a copy of PlatformDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformDtoCopyWith<PlatformDto> get copyWith => _$PlatformDtoCopyWithImpl<PlatformDto>(this as PlatformDto, _$identity);

  /// Serializes this PlatformDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,image);

@override
String toString() {
  return 'PlatformDto(id: $id, name: $name, url: $url, image: $image)';
}


}

/// @nodoc
abstract mixin class $PlatformDtoCopyWith<$Res>  {
  factory $PlatformDtoCopyWith(PlatformDto value, $Res Function(PlatformDto) _then) = _$PlatformDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String url, String image
});




}
/// @nodoc
class _$PlatformDtoCopyWithImpl<$Res>
    implements $PlatformDtoCopyWith<$Res> {
  _$PlatformDtoCopyWithImpl(this._self, this._then);

  final PlatformDto _self;
  final $Res Function(PlatformDto) _then;

/// Create a copy of PlatformDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlatformDto implements PlatformDto {
  const _PlatformDto({required this.id, required this.name, required this.url, required this.image});
  factory _PlatformDto.fromJson(Map<String, dynamic> json) => _$PlatformDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String url;
@override final  String image;

/// Create a copy of PlatformDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformDtoCopyWith<_PlatformDto> get copyWith => __$PlatformDtoCopyWithImpl<_PlatformDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,image);

@override
String toString() {
  return 'PlatformDto(id: $id, name: $name, url: $url, image: $image)';
}


}

/// @nodoc
abstract mixin class _$PlatformDtoCopyWith<$Res> implements $PlatformDtoCopyWith<$Res> {
  factory _$PlatformDtoCopyWith(_PlatformDto value, $Res Function(_PlatformDto) _then) = __$PlatformDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String url, String image
});




}
/// @nodoc
class __$PlatformDtoCopyWithImpl<$Res>
    implements _$PlatformDtoCopyWith<$Res> {
  __$PlatformDtoCopyWithImpl(this._self, this._then);

  final _PlatformDto _self;
  final $Res Function(_PlatformDto) _then;

/// Create a copy of PlatformDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? image = null,}) {
  return _then(_PlatformDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
