import 'package:application/controllers/generic_controller.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/http_request.dart';

class PlatformController extends GenericController<PlatformDto> {
  static final PlatformController instance = PlatformController();

  @override
  Future<Iterable<PlatformDto>> fetchItems() async {
    final List<dynamic> json = await HttpRequest.instance.get<List<dynamic>>(
      '/v1/platforms',
    );

    final Iterable<PlatformDto> list = json.map(
      (final dynamic e) => PlatformDto.fromJson(e as Map<String, dynamic>),
    );

    return list;
  }
}
