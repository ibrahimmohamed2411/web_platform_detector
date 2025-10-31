import 'package:flutter_test/flutter_test.dart';
import 'package:web_platform_detector/src/web_platform_detector.dart';

void main() {
  group('WebPlatformDetector', () {
    test('has callable API', () {
      expect(WebPlatformDetector.isAndroid, isA<Function>());
      expect(WebPlatformDetector.isIOS, isA<Function>());
    });

    test('openStore() should throw on non-web platforms', () {
      expect(
        () => WebPlatformDetector.openStore(
          androidUrl: 'https://play.google.com/store/apps/details?id=com.example.app',
          iosUrl: 'https://apps.apple.com/app/example-app/id123456789',
          fallbackUrl: 'https://example.com',
        ),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
