import 'package:application/core/logger/app_logger.dart';
import 'package:application/core/network/api_result.dart';
import 'package:application/models/grouped_episode_model.dart';
import 'package:application/models/lang_type.dart';
import 'package:application/models/pageable_model.dart';
import 'package:application/repositories/grouped_episode_repository.dart';
import 'package:application/viewmodels/lang_type_filter_view_model.dart';
import 'package:material_ui/material_ui.dart';

class GroupedEpisodeViewModel extends ChangeNotifier
    implements LangTypeFilterViewModel {
  GroupedEpisodeViewModel(this._repository) {
    _scrollController.addListener(_scrollListener);
  }

  final GroupedEpisodeRepository _repository;
  final _episodes = <GroupedEpisodeModel>[];
  final _scrollController = ScrollController();
  bool _loading = false;
  bool _canLoadMore = true;
  int _page = 1;
  static const _limit = 15;
  final _selectedLangTypes = <LangType>[];

  int get length => _episodes.length + (_loading ? 4 : 0);

  GroupedEpisodeModel? getOrNull(int index) =>
      index >= 0 && index < _episodes.length ? _episodes[index] : null;

  ScrollController get scrollController => _scrollController;

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
    if (!bypass && _episodes.isNotEmpty) return;
    _episodes.clear();
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

    await _fetchGroupedEpisodes(_page, _limit);
  }

  void _setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<void> _fetchGroupedEpisodes(int page, int limit) async {
    if (_loading || !_canLoadMore) return;
    _setLoading(true);
    final response = await _repository.getGroupedEpisodes(
      page,
      limit,
      langTypes: _selectedLangTypes,
    );

    switch (response) {
      case ApiSuccess<PageableModel<GroupedEpisodeModel>>(:final data):
        _episodes.addAll(data.data);
        _canLoadMore = data.total > _episodes.length;
        break;
      case ApiFailure<PageableModel<GroupedEpisodeModel>> failure:
        // Handle error, e.g., log it or show a message to the user
        AppLogger.print(
          'Error fetching grouped episodes: ${failure.statusCode} - ${failure.error}',
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
      _fetchGroupedEpisodes(++_page, _limit);
    }
  }
}
