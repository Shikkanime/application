import 'package:application/core/network/api_result.dart';
import 'package:application/core/network/http_client.dart';
import 'package:application/models/anime_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/pageable_model.dart';

class AnimeRepository {
  const AnimeRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<ApiResult<PageableModel<AnimeModel>>> getAnimes(
    int page,
    int limit, {
    String? query,
    String? simulcast,
    List<LangType>? langTypes,
  }) async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      'v1/animes',
      queryParameters: {
        'country': 'FR',
        if (query != null && query.isNotEmpty) 'name': query,
        if (simulcast != null && simulcast.isNotEmpty) 'simulcast': simulcast,
        'page': page,
        'limit': limit,
        if (query == null || query.isEmpty) 'sort': 'name',
        if (langTypes != null && langTypes.isNotEmpty)
          'searchTypes': langTypes.map((e) => e.name.toUpperCase()).join(','),
      },
    );

    return switch (response) {
      ApiSuccess<Map<String, dynamic>>(:final data) =>
        ApiSuccess<PageableModel<AnimeModel>>(
          PageableModel.fromJson(
            data,
            (json) => AnimeModel.fromJson(json as Map<String, dynamic>),
          ),
        ),
      ApiFailure<Map<String, dynamic>> failure =>
        ApiFailure<PageableModel<AnimeModel>>(
          failure.error,
          failure.statusCode,
        ),
    };
  }
}
