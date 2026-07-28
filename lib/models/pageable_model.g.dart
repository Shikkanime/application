// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableModel<T> _$PageableModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PageableModel<T>(
  (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  (json['page'] as num).toInt(),
  (json['limit'] as num).toInt(),
  (json['total'] as num).toInt(),
);
