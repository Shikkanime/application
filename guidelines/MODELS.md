# Models Guide

Models are **immutable data-transfer objects (DTOs)** that mirror the API payloads. They live in `lib/models/` and are primarily generated with `json_serializable`.

## Immutability

- All fields are `final` and assigned through a generative constructor.
- Provide a `@JsonSerializable` factory `fromJson` so the model can be rebuilt from an API response. Do not use setters; changes mean a new instance (through the data layer).

```dart
import 'package:application/models/anime_platform_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable(createToJson: false)
class AnimeModel {
  final String uuid;
  final String shortName;
  final List<LangType> langTypes;
  final List<AnimePlatformModel> platformIds;

  AnimeModel(this.uuid, this.shortName, this.langTypes, this.platformIds);

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}
```

## Generated code

- Each model has a sibling `.g.dart` file referenced via `part 'anime_model.g.dart';`.
- Generated files are produced by running `dart run build_runner build`.
- `analysis_options.yaml` excludes `lib/models/*.g.dart` from the analyzer. Do not hand-edit generated files.

## Generic models

- For generic models (e.g. pagination wrappers), enable `genericArgumentFactories: true` and pass the item factory through `fromJson`:

```dart
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
```

## Enums

- Use `@JsonEnum` with an explicit field renaming strategy to keep wire-format stable:

```dart
@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum LangType { subtitles, voice }
```

## API result wrapper

- The API returns a `sealed class ApiResult<T>` with `ApiSuccess<T>` and `ApiFailure<T>` subtypes. Models are returned inside `ApiSuccess<T>`. Consumers exhaustively `switch` over the sealed class (see the [API Conventions](API_CONVENTIONS.md)).

- 🌱 To consider for the rework: Flutter officially recommends generated immutable models with `freezed` or `built_value` (deep equality, copyWith, JSON). Not required now; `json_serializable` is the documented norm.