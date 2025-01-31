import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

enum PlatformExtension { iOS, android, web }

extension PlatformExtensionGetter on BuildContext {
  PlatformExtension get platform {
    if (kIsWeb) return PlatformExtension.web;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return PlatformExtension.iOS;
    }
    return PlatformExtension.android;
  }
}
