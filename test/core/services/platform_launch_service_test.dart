import 'package:application/core/services/platform_launch_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import 'fake_url_launcher_platform.dart';
import 'throwing_url_launcher_platform.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PlatformLaunchService.launch', () {
    test('rejects a malformed URL without calling the platform', () async {
      // Given
      final platform = FakeUrlLauncherPlatform();
      UrlLauncherPlatform.instance = platform;
      const service = PlatformLaunchService();

      // When
      final launched = await service.launch('::not a url::');

      // Then
      expect(launched, isFalse);
      expect(platform.calls, isEmpty);
    });

    test('rejects a non-https URL without calling the platform', () async {
      // Given
      final platform = FakeUrlLauncherPlatform();
      UrlLauncherPlatform.instance = platform;
      const service = PlatformLaunchService();

      // When
      final launched = await service.launch('http://example.com/page');

      // Then
      expect(launched, isFalse);
      expect(platform.calls, isEmpty);
    });

    test('launches an https URL on the first mode and stops', () async {
      // Given
      final platform = FakeUrlLauncherPlatform();
      UrlLauncherPlatform.instance = platform;
      const service = PlatformLaunchService();

      // When
      final launched = await service.launch('https://example.com/page');

      // Then
      expect(launched, isTrue);
      expect(platform.calls, hasLength(1));
      expect(
        platform.calls.first.$2,
        PreferredLaunchMode.externalNonBrowserApplication,
      );
    });

    test('falls back to the next mode when the previous one fails', () async {
      // Given
      final platform = FakeUrlLauncherPlatform(result: false);
      UrlLauncherPlatform.instance = platform;
      const service = PlatformLaunchService();

      // When
      final launched = await service.launch('https://example.com/page');

      // Then
      expect(launched, isFalse);
      expect(platform.calls, hasLength(3));
      expect(platform.calls.map((call) => call.$2), <PreferredLaunchMode>[
        PreferredLaunchMode.externalNonBrowserApplication,
        PreferredLaunchMode.externalApplication,
        PreferredLaunchMode.platformDefault,
      ]);
    });

    test('returns false on PlatformException and keeps falling back', () async {
      // Given
      final platform = ThrowingUrlLauncherPlatform();
      UrlLauncherPlatform.instance = platform;
      const service = PlatformLaunchService();

      // When
      final launched = await service.launch('https://example.com/page');

      // Then
      expect(launched, isFalse);
      expect(platform.calls, hasLength(3));
    });
  });
}
