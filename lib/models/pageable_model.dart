import 'package:json_annotation/json_annotation.dart';

part 'pageable_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PageableModel<T> {
  final List<T> data;
  final int page;
  final int limit;
  final int total;

  PageableModel(this.data, this.page, this.limit, this.total);

  factory PageableModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PageableModelFromJson(json, fromJsonT);
}
