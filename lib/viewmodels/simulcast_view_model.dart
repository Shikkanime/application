import 'package:application/core/logger/app_logger.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/models/simulcast_model.dart';
import 'package:application/repositories/simulcast_repository.dart';
import 'package:material_ui/material_ui.dart';

class SimulcastViewModel extends ChangeNotifier {
  SimulcastViewModel(this._repository);

  final SimulcastRepository _repository;
  final _simulcasts = <SimulcastModel>[];
  bool _loading = false;

  List<SimulcastModel> get simulcasts => _simulcasts;

  void _setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> init({bool bypass = false}) async {
    if (_loading || (!bypass && _simulcasts.isNotEmpty)) return;
    _setLoading(true);

    final response = await _repository.getSimulcasts();

    switch (response) {
      case ApiSuccess<List<SimulcastModel>>(:final data):
        _simulcasts.clear();
        _simulcasts.addAll(data);
        break;
      case ApiFailure<List<SimulcastModel>> failure:
        AppLogger.print(
          'Failed to fetch simulcasts: ${failure.error}, status code: ${failure.statusCode}',
        );
        break;
    }

    _setLoading(false);
  }
}
