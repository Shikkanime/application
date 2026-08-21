import 'package:application/models/platform_model.dart';
import 'package:application/models/source_model.dart';
import 'package:application/services/url_launcher_service.dart';
import 'package:material_ui/material_ui.dart';

class AvailablePlatformsViewModel extends ChangeNotifier {
  AvailablePlatformsViewModel(this._urlLauncherService);

  final UrlLauncherService _urlLauncherService;

  Set<PlatformModel> getPlatforms(Iterable<SourceModel> sources) =>
      sources.map((source) => source.platform).toSet();

  SourceModel? getSourceForPlatform(
    Iterable<SourceModel> sources,
    PlatformModel platform,
  ) => sources
      .where((source) => source.platform.name == platform.name)
      .firstOrNull;

  Future<bool> launchSource(SourceModel source) =>
      _urlLauncherService.launch(source.url);

  Future<bool> launchPlatform(
    Iterable<SourceModel> sources,
    PlatformModel platform,
  ) {
    final source = getSourceForPlatform(sources, platform);
    if (source == null) return Future.value(false);

    return launchSource(source);
  }

  Future<bool> launchFirstSource(Iterable<SourceModel> sources) {
    final source = sources.firstOrNull;
    if (source == null) return Future.value(false);

    return launchSource(source);
  }
}
