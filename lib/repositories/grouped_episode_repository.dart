import 'package:application/core/network/api_result.dart';
import 'package:application/core/network/http_client.dart';
import 'package:application/models/grouped_episode_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/pageable_model.dart';

class GroupedEpisodeRepository {
  const GroupedEpisodeRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<ApiResult<PageableModel<GroupedEpisodeModel>>> getGroupedEpisodes(
    int page,
    int limit, {
    List<LangType>? langTypes,
  }) async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      'v2/episode-mappings',
      queryParameters: {
        'country': 'FR',
        'page': page,
        'limit': limit,
        if (langTypes != null && langTypes.isNotEmpty)
          'searchTypes': langTypes.map((e) => e.name.toUpperCase()).join(','),
      },
    );

    return switch (response) {
      ApiSuccess<Map<String, dynamic>>(:final data) =>
        ApiSuccess<PageableModel<GroupedEpisodeModel>>(
          PageableModel.fromJson(
            data,
            (json) =>
                GroupedEpisodeModel.fromJson(json as Map<String, dynamic>),
          ),
        ),
      ApiFailure<Map<String, dynamic>> failure =>
        ApiFailure<PageableModel<GroupedEpisodeModel>>(
          failure.error,
          failure.statusCode,
        ),
    };
  }
}
