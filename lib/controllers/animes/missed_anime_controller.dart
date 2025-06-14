import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/constant.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class MissedAnimeController extends GenericController<MissedAnimeDto> {
  static final MissedAnimeController instance = MissedAnimeController();
  bool _isRetry = false;

  int get _limit =>
      Constant.isAndroidOrIOS &&
          wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 9
      : 24;

  void setItems(final List<MissedAnimeDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Iterable<MissedAnimeDto>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes/missed?page=$page&limit=$_limit',
      token: MemberController.instance.member!.token,
      onUnauthorized: () async {
        if (_isRetry) {
          return;
        }

        _isRetry = true;
        await MemberController.instance.login();
        await fetchItems();
      },
    );

    _isRetry = false;

    return pageableDto.data.map(
      (final dynamic e) => MissedAnimeDto.fromJson(e as Map<String, dynamic>),
    );
  }
}
