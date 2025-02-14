import 'package:findpro/common/const/api_key.dart';
import 'package:flutter/foundation.dart';

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return ApiKey.unityAndroidGameId;
    } else {
      return ApiKey.unityIosGameId;
    }
  }

  static String get bannerAdPlacement {
    return defaultTargetPlatform == TargetPlatform.android
        ? ApiKey.bannerAdPlacementAndroid
        : ApiKey.bannerAdPlacementIos;
  }

  static String get rewardedVideoAdPlacement {
    return defaultTargetPlatform == TargetPlatform.android
        ? ApiKey.rewardedVideoAdPlacementAndroid
        : ApiKey.rewardedVideoAdPlacementIos;
  }

  static String get interstitialVideoAdPlacement {
    return defaultTargetPlatform == TargetPlatform.android
        ? ApiKey.interstitialAdAndroid
        : ApiKey.interstitialAdIos;
  }

  static final Map<String, bool> placements = {
    bannerAdPlacement: false,
    rewardedVideoAdPlacement: false,
    interstitialVideoAdPlacement: false,
  };
}
