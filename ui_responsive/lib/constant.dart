import 'dart:io';
import 'dart:ui';

class PlatformData {
  static Map<String, dynamic> screens = {
    // common desktop screens
    'desktop': {
      '5xlarge': const Size(1920, 1080),
      '4xlarge': const Size(1600, 900),
      '3xlarge': const Size(1536, 864),
      'xxlarge': const Size(1440, 900),
      'xlarge': const Size(1366, 768),
      'large': const Size(1280, 720),
      'medium': const Size(1024, 768),
      // half screen
      'xmedium': const Size(768, 720),
    },
    // common tablet screens
    'tablet': {
      'large': const Size(1280, 720),
      'medium': const Size(768, 1024),
      'xxmedium': const Size(800, 1280),
      'small': const Size(601, 962),
    },
    // common mobile screens
    'mobile': {
      'large': const Size(414, 896),
      'medium': const Size(375, 812),
      'xmedium': const Size(375, 667),
      'xsmall': const Size(360, 800),
      'xxsmall': const Size(360, 640),
    }
  };

  static bool get isDesktop =>
      Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  static bool get _isMobile =>
      Platform.isAndroid || Platform.isFuchsia || Platform.isIOS;

  static bool isTablet(Size size) =>
      _isMobile && size.width > (screens['mobile']['large'] as Size).width;

  static bool isMobile(Size size) =>
      _isMobile && size.width < (screens['tablet']['small'] as Size).width;
}
