import 'dart:async';

import 'package:application/controllers/shared_preferences_controller.dart';

enum SortType {
  oldest(
    value: <String, String>{
      'sort': 'releaseDateTime,season,episodeType,number',
    },
  ),
  newest(
    value: <String, String>{
      'sort': 'releaseDateTime,season,episodeType,number',
      'desc': 'releaseDateTime,season,episodeType,number',
    },
  );

  const SortType({required this.value});

  final Map<String, String> value;
}

class SortController {
  static final SortController instance = SortController();
  final String key = 'sortType';
  final StreamController<SortType> streamController =
      StreamController<SortType>.broadcast();

  SortType get sortType =>
      SortType.values[SharedPreferencesController.instance.getInt(key) ?? 0];

  Future<void> init() async {
    if (!SharedPreferencesController.instance.containsKey(key)) {
      await setSortType(SortType.oldest);
    }
  }

  Future<void> setSortType(final SortType sortType) async {
    await SharedPreferencesController.instance.setInt(key, sortType.index);
    streamController.add(sortType);
  }
}
