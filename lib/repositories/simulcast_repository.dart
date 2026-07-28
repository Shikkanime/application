import 'package:application/core/network/api_result.dart';
import 'package:application/core/network/http_client.dart';
import 'package:application/models/simulcast_model.dart';

class SimulcastRepository {
  const SimulcastRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<ApiResult<List<SimulcastModel>>> getSimulcasts() async {
    final response = await _httpClient.get<List<dynamic>>('v1/simulcasts');

    return switch (response) {
      ApiSuccess<List<dynamic>>(:final data) =>
        ApiSuccess<List<SimulcastModel>>(
          data
              .map((e) => SimulcastModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ApiFailure<List<dynamic>> failure => ApiFailure<List<SimulcastModel>>(
        failure.error,
        failure.statusCode,
      ),
    };
  }
}
