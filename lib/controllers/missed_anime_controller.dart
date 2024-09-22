import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class MissedAnimeController extends GenericController<MissedAnimeDto> {
  static final instance = MissedAnimeController();

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 9
          : 24;

  void setItems(List<MissedAnimeDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Iterable<MissedAnimeDto>> fetchItems() async {
    final pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes/missed?page=$page&limit=$_limit',
      token: MemberController.instance.member!.token,
    );

    return pageableDto.data
        .map((e) => MissedAnimeDto.fromJson(e as Map<String, dynamic>));
  }
}
