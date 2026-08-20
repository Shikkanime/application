import 'package:application/core/logger/app_logger.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/models/anime_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/pageable_model.dart';
import 'package:application/models/simulcast_model.dart';
import 'package:application/repositories/anime_repository.dart';
import 'package:application/viewmodels/lang_type_filter_view_model.dart';
import 'package:application/viewmodels/simulcast_view_model.dart';
import 'package:material_ui/material_ui.dart';

class AnimeViewModel extends ChangeNotifier implements LangTypeFilterViewModel {
  AnimeViewModel(this._repository, this._simulcastViewModel) {
    _textEditingController.addListener(() => init(bypass: true));
    _scrollController.addListener(_scrollListener);
  }

  final AnimeRepository _repository;
  final SimulcastViewModel _simulcastViewModel;

  final _animes = <AnimeModel>[];
  final _scrollController = ScrollController();
  bool _loading = false;
  bool _canLoadMore = true;
  int _page = 1;
  static const _limit = 15;
  final TextEditingController _textEditingController = TextEditingController();
  SimulcastModel? _selectedSimulcast;
  bool _simulcastSelectionInitialized = false;
  final _selectedLangTypes = <LangType>[];

  int get length => _animes.length + (_loading ? 8 : 0);

  AnimeModel? getOrNull(int index) =>
      index >= 0 && index < _animes.length ? _animes[index] : null;

  bool get isLoading => _loading;

  ScrollController get scrollController => _scrollController;

  TextEditingController get textEditingController => _textEditingController;

  List<SimulcastModel> get simulcasts => _simulcastViewModel.simulcasts;

  SimulcastModel? get selectedSimulcast => _selectedSimulcast;

  bool get simulcastSelectionInitialized => _simulcastSelectionInitialized;

  void setSelectedSimulcast(String? simulcastUuid) {
    _selectedSimulcast = simulcastUuid != null
        ? simulcasts.firstWhere((s) => s.uuid == simulcastUuid)
        : null;
    _simulcastSelectionInitialized = true;

    if (simulcastUuid == null) {
      AppLogger.print('Selected simulcast: All');
    } else {
      AppLogger.print('Selected simulcast: ${_selectedSimulcast?.season} - ${_selectedSimulcast?.year}');
    }

    notifyListeners();
    init(bypass: true);
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
    if (!_simulcastSelectionInitialized) {
      await _simulcastViewModel.init(bypass: bypass);

      if (simulcasts.isNotEmpty) {
        _selectedSimulcast = simulcasts.first;
        _simulcastSelectionInitialized = true;
      }
    }

    if (!bypass && _animes.isNotEmpty) return;

    _animes.clear();
    _loading = false;
    _canLoadMore = true;
    _page = 1;

    if (_scrollController.hasClients) {
      await _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    await _fetchAnimes(_page, _limit);
  }

  void _setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> _fetchAnimes(int page, int limit) async {
    if (_loading || !_canLoadMore) return;
    _setLoading(true);
    final response = await _repository.getAnimes(
      query: _textEditingController.text,
      simulcast: _selectedSimulcast?.uuid,
      langTypes: _selectedLangTypes,
      page,
      limit,
    );

    switch (response) {
      case ApiSuccess<PageableModel<AnimeModel>>(:final data):
        _animes.addAll(data.data);
        _canLoadMore = data.total > _animes.length;
        break;
      case ApiFailure<PageableModel<AnimeModel>> failure:
        AppLogger.print(
          'Error fetching animes: ${failure.statusCode} - ${failure.error}',
        );
        break;
    }

    _setLoading(false);
  }

  void _scrollListener() {
    final scrollPosition = _scrollController.position;
    final needToLoadMore =
        scrollPosition.pixels >= scrollPosition.maxScrollExtent * 0.8;

    if (needToLoadMore && !_loading && _canLoadMore) {
      _fetchAnimes(++_page, _limit);
    }
  }
}
