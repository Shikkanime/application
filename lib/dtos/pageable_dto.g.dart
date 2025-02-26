// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageableDto _$PageableDtoFromJson(Map<String, dynamic> json) => _PageableDto(
  data: json['data'] as List<dynamic>,
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$PageableDtoToJson(_PageableDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
    };
