import 'package:application/services/url_launcher_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UrlLauncherService', () {
    test('launch returns false for invalid non-HTTPS URL', () async {
      // Given
      const service = UrlLauncherService();

      // When
      final result = await service.launch('not-a-url');

      // Then
      expect(result, isFalse);
    });

    test('launch returns false for HTTP (non-secure) URL', () async {
      // Given
      const service = UrlLauncherService();

      // When
      final result = await service.launch('http://example.com');

      // Then
      expect(result, isFalse);
    });

    test('launch returns false for empty URL', () async {
      // Given
      const service = UrlLauncherService();

      // When
      final result = await service.launch('');

      // Then
      expect(result, isFalse);
    });
  });
}
