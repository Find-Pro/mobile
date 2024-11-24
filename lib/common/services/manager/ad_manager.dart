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

  static String get bannerAdPlacement => ApiKey.bannerAdPlacement;
  static String get rewardedVideoAdPlacement =>
      ApiKey.rewardedVideoAdPlacement;
  static String get interstitialVideoAdPlacement =>
      ApiKey.interstitialVideoAdPlacement;

  static final Map<String, bool> placements = {
    bannerAdPlacement: false,
    rewardedVideoAdPlacement: false,
    interstitialVideoAdPlacement: false,
  };
}
