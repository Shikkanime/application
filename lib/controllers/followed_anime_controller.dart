import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/anime_dto.dart';
import 'package:application/utils/http_request.dart';

class FollowedAnimeController extends GenericController<AnimeDto> {
  static final instance = FollowedAnimeController();
  final _limit = 8;

  @override
  Future<Iterable<AnimeDto>> fetchItems() async {
    final pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes?page=$page&limit=$_limit',
      token: MemberController.instance.member?.token,
    );

    return pageableDto.data
        .map((e) => AnimeDto.fromJson(e as Map<String, dynamic>));
  }

  @override
  void dispose() {
    if (items.length > _limit) {
      items.removeRange(_limit, items.length);
    }

    page = 1;
  }
}
