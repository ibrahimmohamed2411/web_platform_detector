# web_platform_detector

A lightweight Flutter web utility to detect the user's platform (Android/iOS/Desktop) and redirect them to the appropriate app store or a fallback URL.

## 🚀 Features

- **Platform Detection**: Detects whether the user is on Android, iOS, or Desktop via browser user agent
- **Smart Store Redirection**: Automatically opens the correct app store link based on the detected platform
- **Customizable URLs**: Support for custom store URLs for Android, iOS, and fallback destinations
- **Zero Dependencies**: Pure Dart implementation with no external packages
- **Flutter Web Optimized**: Designed specifically for Flutter Web applications



---

## 🎯 Usage

### Basic Platform Detection

```dart
import 'package:web_platform_detector/web_platform_detector.dart';

// Check if user is on Android
if (WebPlatformDetector.isAndroid()) {
  print('User is on Android');
}

// Check if user is on iOS
if (WebPlatformDetector.isIOS()) {
  print('User is on iOS');
}

// Check if user is on any mobile browser
if (WebPlatformDetector.isMobileWeb()) {
  print('User is on mobile');
}

// Get platform name as string
String platform = WebPlatformDetector.getPlatformName();
print('Platform: $platform'); // 'android', 'ios', or 'desktop'
```

### Opening App Store Links

```dart
import 'package:web_platform_detector/web_platform_detector.dart';

// Redirect users to the appropriate store
WebPlatformDetector.openStore(
  androidUrl: 'https://play.google.com/store/apps/details?id=com.example.app',
  iosUrl: 'https://apps.apple.com/app/id123456789',
  fallbackUrl: 'https://example.com',
);
```

### Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:web_platform_detector/web_platform_detector.dart';

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Download Our App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Platform: ${WebPlatformDetector.getPlatformName()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                WebPlatformDetector.openStore(
                  androidUrl: 'https://play.google.com/store/apps/details?id=com.example.app',
                  iosUrl: 'https://apps.apple.com/app/id123456789',
                  fallbackUrl: 'https://example.com/download',
                );
              },
              child: Text('Download App'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 📖 API Reference

### Methods

#### `isAndroid()`
Returns `true` if the user is on an Android browser.

```dart
bool isAndroid = WebPlatformDetector.isAndroid();
```

#### `isIOS()`
Returns `true` if the user is on an iOS browser (iPhone or iPad).

```dart
bool isIOS = WebPlatformDetector.isIOS();
```

#### `isMobileWeb()`
Returns `true` if the user is on either Android or iOS.

```dart
bool isMobile = WebPlatformDetector.isMobileWeb();
```

#### `getPlatformName()`
Returns a string representing the detected platform: `'android'`, `'ios'`, or `'desktop'`.

```dart
String platform = WebPlatformDetector.getPlatformName();
```

#### `openStore()`
Opens the corresponding app store page based on the detected platform.

**Parameters:**
- `androidUrl` (required): Play Store link for Android users
- `iosUrl` (required): App Store link for iOS users
- `fallbackUrl` (required): URL for desktop or unknown platforms

**Throws:** `ArgumentError` if any URL is empty.

```dart
WebPlatformDetector.openStore(
  androidUrl: 'https://play.google.com/store/apps/details?id=com.example.app',
  iosUrl: 'https://apps.apple.com/app/id123456789',
  fallbackUrl: 'https://example.com',
);
```

---

## ⚠️ Important Notes

- **Flutter Web Only**: This library uses `dart:html` and only works with Flutter Web applications
- **User Agent Detection**: Platform detection relies on browser user agent strings, which can be spoofed
- **New Tab**: Store links open in a new browser tab (`_blank`)
- **URL Validation**: All three URLs (Android, iOS, fallback) must be non-empty strings

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 💡 Use Cases

- **App Landing Pages**: Redirect users to download your mobile app
- **Marketing Campaigns**: Send users to the right store from web campaigns
- **Cross-Platform Apps**: Provide seamless download experience across devices
- **Progressive Web Apps**: Encourage users to download native apps when available

---

## 🐛 Issues

If you encounter any issues or have suggestions, please file them in the [issue tracker](https://github.com/ibrahimmohamed2411/web_platform_detector/issues).