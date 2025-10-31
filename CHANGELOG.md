## 0.0.1

### 🎉 First Release

- Added `WebPlatformDetector` class for detecting user platform on web:
  - `isAndroid()` → detects Android browsers
  - `isIOS()` → detects iPhone/iPad browsers
- Added `openStore()` utility to redirect users to the correct app store:
  - Opens Google Play for Android
  - Opens App Store for iOS
  - Opens fallback URL for other platforms
- Lightweight, zero-dependency Flutter web utility.
- Supports custom URLs via parameters.
