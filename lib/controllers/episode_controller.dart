import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/http_request.dart';

class EpisodeController extends GenericController<EpisodeMappingDto> {
  static final instance = EpisodeController();

  @override
  Future<Iterable<EpisodeMappingDto>> fetchItems() async {
    final pageableDto = await HttpRequest.instance.getPage(
      '/v1/episode-mappings?sort=lastReleaseDateTime,animeName,season,episodeType,number&desc=lastReleaseDateTime,animeName,season,episodeType,number&page=$page&limit=4',
    );

    return pageableDto.data
        .map((e) => EpisodeMappingDto.fromJson(e as Map<String, dynamic>));
  }
}
