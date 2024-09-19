import 'dart:async';

import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/member_controller.dart';
import 'package:application/dtos/missed_anime_dto.dart';
import 'package:application/utils/http_request.dart';

class MissedAnimeController extends GenericController<MissedAnimeDto> {
  static final instance = MissedAnimeController();

  @override
  Future<Iterable<MissedAnimeDto>> fetchItems() async {
    final pageableDto = await HttpRequest.instance.getPage(
      '/v1/animes/missed?page=$page&limit=6',
      token: MemberController.instance.member!.token,
    );

    return pageableDto.data
        .map((e) => MissedAnimeDto.fromJson(e as Map<String, dynamic>));
  }
}
