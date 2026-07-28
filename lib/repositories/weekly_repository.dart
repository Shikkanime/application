import 'package:application/core/network/api_result.dart';
import 'package:application/core/network/http_client.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/weekly_day_model.dart';

class WeeklyRepository {
  const WeeklyRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<ApiResult<List<WeeklyDayModel>>> getWeekly({
    List<LangType>? langTypes,
  }) async {
    final response = await _httpClient.get<List<dynamic>>(
      'v1/animes/weekly',
      queryParameters: {
        'country': 'FR',
        if (langTypes != null && langTypes.isNotEmpty)
          'searchTypes': langTypes.map((e) => e.name.toUpperCase()).join(','),
      },
    );

    return switch (response) {
      ApiSuccess<List<dynamic>>(:final data) =>
        ApiSuccess<List<WeeklyDayModel>>(
          data
              .map((e) => WeeklyDayModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ApiFailure<List<dynamic>> failure => ApiFailure<List<WeeklyDayModel>>(
        failure.error,
        failure.statusCode,
      ),
    };
  }
}
