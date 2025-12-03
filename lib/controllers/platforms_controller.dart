import 'dart:async';

import 'package:application/components/platforms/platform_preference_dialog.dart';
import 'package:application/controllers/generic_controller.dart';
import 'package:application/controllers/shared_preferences_controller.dart';
import 'package:application/dtos/enums/config_property_key.dart';
import 'package:application/dtos/episode_source_dto.dart';
import 'package:application/dtos/platform_dto.dart';
import 'package:application/utils/http_request.dart';
import 'package:flutter/material.dart';

class PlatformsController extends GenericController<PlatformDto> {
  PlatformsController() : super(addScrollListener: false);

  static final PlatformsController instance = PlatformsController();
  static const int _unrankedIndex = 1 << 20;

  @override
  Future<Pair<Iterable<PlatformDto>, int>> fetchItems() async {
    final List<dynamic> data = await HttpRequest.instance.get<List<dynamic>>(
      '/v1/platforms',
    );

    final List<PlatformDto> platforms = data
        .map(
          (final dynamic e) => PlatformDto.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return Pair<Iterable<PlatformDto>, int>(platforms, platforms.length);
  }

  Future<List<PlatformDto>> managePlatformPreferences(
    final BuildContext context,
    final List<PlatformDto> items, {
    final bool isForSettings = false,
  }) async {
    final List<PlatformDto> platforms = _sort<PlatformDto>(
      items,
      (final PlatformDto p) => p.id,
    );
    final PlatformPreferenceResult? result =
        await PlatformPreferenceDialog.show(
          context,
          platforms: platforms,
          initialRemember: _isRememberEnabled(),
          isForSettings: isForSettings,
        );
    if (result == null) {
      return <PlatformDto>[];
    }
    await _savePreferenceOrderAndRemember(
      result.orderedPlatforms,
      result.remember,
    );
    return result.orderedPlatforms;
  }

  Future<void> handleWatch(
    final BuildContext context,
    final List<EpisodeSourceDto> sources,
  ) async {
    if (sources.isEmpty) {
      return;
    }

    if (_isRememberEnabled()) {
      final List<EpisodeSourceDto> sorted = _sort<EpisodeSourceDto>(
        sources,
        (final EpisodeSourceDto s) => s.platform.id,
      );

      await HttpRequest.instance.launch(sorted.first.url);
      return;
    }

    final List<PlatformDto> platforms = _preparePlatformsFromSources(sources);

    if (platforms.length == 1) {
      final EpisodeSourceDto selected = sources.firstWhere(
        (final EpisodeSourceDto s) => s.platform.id == platforms.first.id,
        orElse: () => sources.first,
      );

      await HttpRequest.instance.launch(selected.url);
      return;
    }

    final PlatformPreferenceResult? result =
        await PlatformPreferenceDialog.show(
          context,
          platforms: platforms,
          initialRemember: _isRememberEnabled(),
        );

    if (result == null) {
      return;
    }

    if (result.remember) {
      await _savePreferenceOrderAndRemember(result.orderedPlatforms, true);
    }

    final String selectedId = result.orderedPlatforms.first.id;
    final EpisodeSourceDto selected = sources.firstWhere(
      (final EpisodeSourceDto s) => s.platform.id == selectedId,
      orElse: () => sources.first,
    );

    await HttpRequest.instance.launch(selected.url);
  }

  List<T> _sort<T>(
    final List<T> list,
    final String Function(T item) idExtractor,
  ) {
    final Map<String, int> index = _buildOrderIndex();
    final List<T> copy = List<T>.from(list)
      ..sort((final T a, final T b) {
        final int ai = index[idExtractor(a)] ?? _unrankedIndex;
        final int bi = index[idExtractor(b)] ?? _unrankedIndex;
        return ai.compareTo(bi);
      });
    return copy;
  }

  List<PlatformDto> _preparePlatformsFromSources(
    final List<EpisodeSourceDto> sources,
  ) {
    final Map<String, EpisodeSourceDto> byId = <String, EpisodeSourceDto>{};
    for (final EpisodeSourceDto s in sources) {
      byId.putIfAbsent(s.platform.id, () => s);
    }
    final List<PlatformDto> uniquePlatforms = byId.values
        .map((final EpisodeSourceDto e) => e.platform)
        .toList();
    return _sort<PlatformDto>(uniquePlatforms, (final PlatformDto p) => p.id);
  }

  Map<String, int> _buildOrderIndex() {
    final List<String> order = _getSavedOrderIds();
    return <String, int>{for (int i = 0; i < order.length; i++) order[i]: i};
  }

  List<String> _getSavedOrderIds() {
    final String? orderStr = SharedPreferencesController.instance.getString(
      ConfigPropertyKey.platformOrder,
    );
    if (orderStr == null || orderStr.isEmpty) {
      return <String>[];
    }
    return orderStr
        .split(',')
        .map((final String e) => e.trim())
        .where((final String e) => e.isNotEmpty)
        .toList();
  }

  bool _isRememberEnabled() => SharedPreferencesController.instance.getBool(
    ConfigPropertyKey.rememberPlatformChoice,
  );

  Future<void> _savePreferenceOrderAndRemember(
    final List<PlatformDto> ordered,
    final bool remember,
  ) async {
    final String newOrder = ordered
        .map((final PlatformDto p) => p.id)
        .join(',');
    await SharedPreferencesController.instance.setString(
      ConfigPropertyKey.platformOrder,
      newOrder,
    );
    await SharedPreferencesController.instance.setBool(
      ConfigPropertyKey.rememberPlatformChoice,
      remember,
    );
  }
}
