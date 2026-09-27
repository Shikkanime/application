import 'package:application/models/lang_type.dart';
import 'package:application/models/platform_model.dart';
import 'package:application/models/source_model.dart';
import 'package:application/services/url_launcher_service.dart';
import 'package:application/viewmodels/available_platforms_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeUrlLauncherService extends UrlLauncherService {
  const FakeUrlLauncherService({this.launchResult = true});

  final bool launchResult;

  @override
  Future<bool> launch(String url) async => launchResult;
}

void main() {
  final crunchyroll = PlatformModel(
    'Crunchyroll',
    'https://crunchyroll.com/icon.png',
  );
  final netflix = PlatformModel('Netflix', 'https://netflix.com/icon.png');

  final source1 = SourceModel(
    crunchyroll,
    'https://crunchyroll.com/watch/1',
    LangType.subtitles,
  );
  final source2 = SourceModel(
    netflix,
    'https://netflix.com/watch/2',
    LangType.voice,
  );
  final source3 = SourceModel(
    crunchyroll,
    'https://crunchyroll.com/watch/3',
    LangType.voice,
  );

  group('AvailablePlatformsViewModel', () {
    test('getPlatforms returns deduplicated set of platforms from sources', () {
      // Given
      final viewModel = AvailablePlatformsViewModel(
        const FakeUrlLauncherService(),
      );
      final sources = <SourceModel>[source1, source2, source3];

      // When
      final platforms = viewModel.getPlatforms(sources);

      // Then
      expect(platforms, {crunchyroll, netflix});
    });

    test('getSourceForPlatform returns corresponding source when matching platform exists', () {
      // Given
      final viewModel = AvailablePlatformsViewModel(
        const FakeUrlLauncherService(),
      );
      final sources = <SourceModel>[source1, source2];

      // When
      final source = viewModel.getSourceForPlatform(sources, netflix);

      // Then
      expect(source, source2);
    });

    test(
      'getSourceForPlatform returns null when no matching platform exists',
      () {
        // Given
        final viewModel = AvailablePlatformsViewModel(
          const FakeUrlLauncherService(),
        );
        final sources = <SourceModel>[source1];

        // When
        final source = viewModel.getSourceForPlatform(sources, netflix);

        // Then
        expect(source, isNull);
      },
    );

    test(
      'launchSource delegates to UrlLauncherService with source url',
      () async {
        // Given
        var launchedUrl = '';
        final fakeService = _CapturingUrlLauncherService(
          (url) => launchedUrl = url,
        );
        final viewModel = AvailablePlatformsViewModel(fakeService);

        // When
        final result = await viewModel.launchSource(source1);

        // Then
        expect(result, isTrue);
        expect(launchedUrl, source1.url);
      },
    );

    test('launchPlatform finds source and launches it', () async {
      // Given
      var launchedUrl = '';
      final fakeService = _CapturingUrlLauncherService(
        (url) => launchedUrl = url,
      );
      final viewModel = AvailablePlatformsViewModel(fakeService);
      final sources = <SourceModel>[source1, source2];

      // When
      final result = await viewModel.launchPlatform(sources, netflix);

      // Then
      expect(result, isTrue);
      expect(launchedUrl, source2.url);
    });

    test('launchPlatform returns false when platform is not found', () async {
      // Given
      final viewModel = AvailablePlatformsViewModel(
        const FakeUrlLauncherService(),
      );
      final sources = <SourceModel>[source1];

      // When
      final result = await viewModel.launchPlatform(sources, netflix);

      // Then
      expect(result, isFalse);
    });

    test('launchFirstSource launches first source from collection', () async {
      // Given
      var launchedUrl = '';
      final fakeService = _CapturingUrlLauncherService(
        (url) => launchedUrl = url,
      );
      final viewModel = AvailablePlatformsViewModel(fakeService);
      final sources = <SourceModel>[source1, source2];

      // When
      final result = await viewModel.launchFirstSource(sources);

      // Then
      expect(result, isTrue);
      expect(launchedUrl, source1.url);
    });

    test('launchFirstSource returns false when sources is empty', () async {
      // Given
      final viewModel = AvailablePlatformsViewModel(
        const FakeUrlLauncherService(),
      );

      // When
      final result = await viewModel.launchFirstSource(<SourceModel>[]);

      // Then
      expect(result, isFalse);
    });
  });
}

class _CapturingUrlLauncherService extends UrlLauncherService {
  const _CapturingUrlLauncherService(this.onLaunch);

  final void Function(String url) onLaunch;

  @override
  Future<bool> launch(String url) async {
    onLaunch(url);
    return true;
  }
}
