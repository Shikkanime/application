// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageableDtoImpl _$$PageableDtoImplFromJson(Map<String, dynamic> json) =>
    _$PageableDtoImpl(
      data: json['data'] as List<dynamic>,
      page: json['page'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$PageableDtoImplToJson(_$PageableDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
    };
