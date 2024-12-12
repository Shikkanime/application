import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class FollowedAnimeController extends GenericController<AnimeDto> {
  static final FollowedAnimeController instance = FollowedAnimeController();

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
          ? 9
          : 24;

  void setItems(final List<AnimeDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes?page=$page&limit=$_limit',
      token: MemberController.instance.member?.token,
    );

    return pageableDto.data
        .map((final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>));
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
