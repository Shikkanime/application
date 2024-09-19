import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

enum SortType {
  oldest(value: {'sort': 'releaseDateTime,season,episodeType,number'}),
  newest(value: {
    'sort': 'releaseDateTime,season,episodeType,number',
    'desc': 'releaseDateTime,season,episodeType,number'
  }),
  ;

  final Map<String, String> value;

  const SortType({
    required this.value,
  });
}

class SortController {
  static final instance = SortController();
  final String key = 'sortType';
  late final SharedPreferences _sharedPreferences;
  final streamController = StreamController<SortType>.broadcast();

  SortType get sortType => SortType.values[_sharedPreferences.getInt(key) ?? 0];

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    if (!_sharedPreferences.containsKey(key)) {
      await setSortType(SortType.oldest);
    }
  }

  Future<void> setSortType(SortType sortType) async {
    await _sharedPreferences.setInt(key, sortType.index);
    streamController.add(sortType);
  }
}
