import 'dart:math';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/grouped_episode_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;
import 'package:flutter/material.dart';

class EpisodeController extends GenericController<GroupedEpisodeDto> {
  static final EpisodeController instance = EpisodeController();

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 4
      : 16;

  int maxElementsPerRow(final BuildContext context) =>
      max(1, (MediaQuery.sizeOf(context).width * 0.0025).floor());

  double placeholderHeight(final BuildContext context) =>
      MediaQuery.sizeOf(context).width * 0.46 / maxElementsPerRow(context);

  void markAs(final GroupedEpisodeDto episode, final bool inWatchlist) {
    final int index = items.indexWhere(
      (final GroupedEpisodeDto e) => e == episode,
    );

    if (index == -1) {
      return;
    }

    debugPrint(
      'Marking episode ${episode.mappings.first} as ${inWatchlist ? 'in' : 'not in'} watchlist',
    );

    items[index] = episode.copyWith(inWatchlist: inWatchlist);
    streamController.add(items);
  }

  @override
  Future<Iterable<GroupedEpisodeDto>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      token: MemberController.instance.member?.token,
      '/v2/episode-mappings?&page=$page&limit=$_limit',
    );

    return pageableDto.data.map(
      (final dynamic e) =>
          GroupedEpisodeDto.fromJson(e as Map<String, dynamic>),
    );
  }
}
