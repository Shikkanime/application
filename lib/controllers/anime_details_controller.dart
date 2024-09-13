import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/sort_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/season_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class AnimeDetailsController extends GenericController<EpisodeMappingDto> {
  static final instance = AnimeDetailsController();

  AnimeDto? anime;
  SeasonDto? season;

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 4
          : 24;

  @override
  Future<Iterable<EpisodeMappingDto>> fetchItems() async {
    final Map<String, dynamic> query = {
      'anime': anime?.uuid,
      if (season != null) 'season': season!.number,
      ...SortController.instance.sortType.value,
      'page': page,
      'limit': _limit,
    };

    final queryString =
        query.entries.map((e) => '${e.key}=${e.value}').join('&');

    final pageableDto =
        await HttpRequest.instance.getPage('/v1/episode-mappings?$queryString');

    return pageableDto.data
        .map((e) => EpisodeMappingDto.fromJson(e as Map<String, dynamic>));
  }
}
