import 'dart:math';

import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/data/models/grouped_episode_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/core/network/api_client.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;
import 'package:flutter/material.dart';

class EpisodeController extends GenericController<GroupedEpisodeDto> {
  static final EpisodeController instance = EpisodeController();
  final ApiClient _client = const ApiClient();

  int get limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 4
      : 16;

  int maxElementsPerRow(final BuildContext context) =>
      max(1, (MediaQuery.sizeOf(context).width * 0.0025).floor());

  double placeholderHeight(final BuildContext context) =>
      MediaQuery.sizeOf(context).width * 0.46 / maxElementsPerRow(context);

  @override
  Future<Pair<Iterable<GroupedEpisodeDto>, int>> fetchItems() async {
    final ApiResult<PageableDto> result = await _client.getPage(
      '/v2/episode-mappings',
      query: <String, Object>{'page': page, 'limit': limit},
    );

    return switch (result) {
      ApiSuccess<PageableDto>(:final data) =>
        Pair<Iterable<GroupedEpisodeDto>, int>(
          data.data.map(
            (final dynamic e) =>
                GroupedEpisodeDto.fromJson(e as Map<String, dynamic>),
          ),
          data.total,
        ),
      ApiFailure<PageableDto>(:final error) => throw Exception(
        'Failed to fetch episodes: $error',
      ),
    };
  }
}
