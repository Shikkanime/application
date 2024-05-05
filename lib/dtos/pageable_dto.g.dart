// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageableDtoImpl _$$PageableDtoImplFromJson(Map<String, dynamic> json) =>
    _$PageableDtoImpl(
      data: json['data'] as List<dynamic>,
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PageableDtoImplToJson(_$PageableDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
    };
