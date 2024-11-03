import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class EpisodeController extends GenericController<EpisodeMappingDto> {
  static final EpisodeController instance = EpisodeController();

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 4
          : 16;

  @override
  Future<Iterable<EpisodeMappingDto>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/episode-mappings?sort=lastReleaseDateTime,animeName,season,episodeType,number&desc=lastReleaseDateTime,animeName,season,episodeType,number&page=$page&limit=$_limit',
    );

    return pageableDto.data.map(
      (final dynamic e) =>
          EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
    );
  }
}
