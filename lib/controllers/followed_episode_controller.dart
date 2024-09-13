import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class FollowedEpisodeController extends GenericController<EpisodeMappingDto> {
  static final instance = FollowedEpisodeController();

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 4
          : 16;

  @override
  Future<Iterable<EpisodeMappingDto>> fetchItems() async {
    final pageableDto = await HttpRequest.instance.getPage(
      '/v1/episode-mappings?page=$page&limit=$_limit',
      token: MemberController.instance.member?.token,
    );

    return pageableDto.data
        .map((e) => EpisodeMappingDto.fromJson(e as Map<String, dynamic>));
  }

  @override
  void dispose() {
    if (items.length > _limit) {
      items.removeRange(_limit, items.length);
    }

    page = 1;
    streamController.add(items);
  }
}
