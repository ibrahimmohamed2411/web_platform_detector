import 'dart:html' as html;

/// A simple helper to detect the user's web platform (Android / iOS / Desktop)
/// and open their app store or custom links accordingly.
///
/// Works only in Flutter web.
class WebPlatformDetector {
  /// Returns `true` if the user is on an Android browser.
  static bool isAndroid() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('android');
  }

  /// Returns `true` if the user is on an iOS browser.
  static bool isIOS() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('iphone') || userAgent.contains('ipad');
  }

  /// Returns `true` if the user is on a mobile browser (Android or iOS).
  static bool isMobileWeb() => isAndroid() || isIOS();

  /// Returns a string representing the detected platform:
  /// `'android'`, `'ios'`, or `'desktop'`.
  static String getPlatformName() {
    if (isAndroid()) return 'android';
    if (isIOS()) return 'ios';
    return 'desktop';
  }

  /// Opens the corresponding app store page depending on the detected platform.
  ///
  /// - [androidUrl]: Play Store link.
  /// - [iosUrl]: App Store link.
  /// - [fallbackUrl]: Used for desktop or unknown platforms.
  static void openStore({
    required String androidUrl,
    required String iosUrl,
    required String fallbackUrl,
  }) {
    if (androidUrl.isEmpty || iosUrl.isEmpty || fallbackUrl.isEmpty) {
      throw ArgumentError(
        'You must provide non-empty URLs for Android, iOS, and fallback.',
      );
    }

    if (isAndroid()) {
      html.window.open(androidUrl, '_blank');
    } else if (isIOS()) {
      html.window.open(iosUrl, '_blank');
    } else {
      html.window.open(fallbackUrl, '_blank');
    }
  }
}
