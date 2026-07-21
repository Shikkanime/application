import 'package:application/ui/viewmodels/generic_controller.dart';
import 'package:application/ui/viewmodels/member_controller.dart';
import 'package:application/data/models/anime_dto.dart';
import 'package:application/data/models/pageable_dto.dart';
import 'package:application/core/network/http_request.dart';
import 'package:application/core/widgets/widget_builder.dart' as wb;

class FollowedAnimeController extends GenericController<AnimeDto> {
  static final FollowedAnimeController instance = FollowedAnimeController();
  bool _isRetry = false;

  int get limit =>
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
  Future<Pair<Iterable<AnimeDto>, int>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes',
      query: <String, Object>{'page': page, 'limit': limit},
      token: MemberController.instance.member?.token,
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

    return Pair<Iterable<AnimeDto>, int>(
      pageableDto.data.map(
        (final dynamic e) => AnimeDto.fromJson(e as Map<String, dynamic>),
      ),
      pageableDto.total,
    );
  }

  @override
  void dispose() {
    if (items.length > limit) {
      items.removeRange(limit, items.length);
    }

    page = 1;
    streamController.add(items);
  }
}
