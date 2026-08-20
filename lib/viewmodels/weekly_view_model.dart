import 'package:application/core/logger/app_logger.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/weekly_day_model.dart';
import 'package:application/models/weekly_release_model.dart';
import 'package:application/repositories/weekly_repository.dart';
import 'package:application/viewmodels/lang_type_filter_view_model.dart';
import 'package:material_ui/material_ui.dart';

class WeeklyViewModel extends ChangeNotifier
    implements LangTypeFilterViewModel {
  WeeklyViewModel(this._repository);

  final WeeklyRepository _repository;
  final _weekly = <WeeklyDayModel>[];
  int _selectedDay = DateTime.now().weekday - 1;
  bool _loading = false;
  final _selectedLangTypes = <LangType>[];

  List<WeeklyReleaseModel>? get _selectedReleases {
    return _selectedDay >= 0 && _selectedDay < _weekly.length
        ? _weekly[_selectedDay].releases
        : null;
  }

  int get length => _selectedReleases != null
      ? _selectedReleases!.length + (_loading ? 4 : 0)
      : (_loading ? 4 : 0);

  WeeklyReleaseModel? getOrNull(int index) =>
      _selectedReleases != null &&
          index >= 0 &&
          index < _selectedReleases!.length
      ? _selectedReleases![index]
      : null;

  int get selectedDay => _selectedDay;

  void setPreviousDay() {
    _selectedDay = (_selectedDay - 1) % 7;
    AppLogger.print('Selected day: $_selectedDay');
    notifyListeners();
  }

  void setNextDay() {
    _selectedDay = (_selectedDay + 1) % 7;
    AppLogger.print('Selected day: $_selectedDay');
    notifyListeners();
  }

  @override
  bool isLangTypeSelected(LangType langType) =>
      _selectedLangTypes.contains(langType);

  @override
  Future<void> onChanged(LangType langType) async {
    if (!_selectedLangTypes.contains(langType)) {
      _selectedLangTypes.add(langType);
    } else {
      _selectedLangTypes.remove(langType);
    }

    await init(bypass: true);
  }

  Future<void> init({bool bypass = false}) async {
    if (!bypass && _weekly.isNotEmpty) return;
    _weekly.clear();
    _loading = false;
    await _fetchWeekly();
  }

  void _setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> _fetchWeekly() async {
    if (_loading) return;
    _setLoading(true);
    final response = await _repository.getWeekly(langTypes: _selectedLangTypes);

    switch (response) {
      case ApiSuccess<List<WeeklyDayModel>>(:final data):
        _weekly.addAll(data);
        break;
      case ApiFailure<List<WeeklyDayModel>> failure:
        AppLogger.print(
          'Error fetching weekly: ${failure.statusCode} - ${failure.error}',
        );
        break;
    }

    _setLoading(false);
  }
}
