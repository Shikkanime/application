import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/episode_mapping_dto.dart';
import 'package:application/dtos/pageable_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:application/utils/widget_builder.dart' as wb;

class FollowedEpisodeController extends GenericController<EpisodeMappingDto> {
  static final FollowedEpisodeController instance = FollowedEpisodeController();
  bool _isRetry = false;

  int get _limit =>
      wb.WidgetBuilder.instance.getDeviceType() == wb.DeviceType.mobile
      ? 9
      : 16;

  void setItems(final List<EpisodeMappingDto> items) {
    this.items.clear();
    this.items.addAll(items);
    streamController.add(this.items);
    page = 2;
    canLoadMore = true;
  }

  @override
  Future<Iterable<EpisodeMappingDto>> fetchItems() async {
    final PageableDto pageableDto = await HttpRequest.instance.getPage(
      '/v1/episode-mappings?page=$page&limit=$_limit',
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

    return pageableDto.data.map(
      (final dynamic e) =>
          EpisodeMappingDto.fromJson(e as Map<String, dynamic>),
    );
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
