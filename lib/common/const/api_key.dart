import 'package:flutter_dotenv/flutter_dotenv.dart';

final class ApiKey {
  static String get baseUrl => dotenv.env['BASE_URL']!;
  static String get webSocketUrl => dotenv.env['WEB_SOCKET_URL']!;
  static String get osAppID => dotenv.env['OS_APP_ID']!;
  static String get osApiKey => dotenv.env['OS_API_KEY']!;
  static String get osPushUrl => dotenv.env['OS_PUSH_URL']!;

  static String get unityIosGameId => dotenv.env['UNITY_IOS_GAME_ID']!;
  static String get unityAndroidGameId =>
      dotenv.env['UNITY_ANDROID_GAME_ID']!;
  static String get bannerAdPlacementAndroid =>
      dotenv.env['BANNER_AD_ANDROID']!;
  static String get bannerAdPlacementIos => dotenv.env['BANNER_AD_IOS']!;
  static String get interstitialAdAndroid =>
      dotenv.env['INTERSTITIAL_AD_ANDROID']!;
  static String get interstitialAdIos =>
      dotenv.env['INTERSTITIAL_AD_IOS']!;
  static String get rewardedVideoAdPlacementAndroid =>
      dotenv.env['REWARDED_AD_ANDROID']!;
  static String get rewardedVideoAdPlacementIos =>
      dotenv.env['REWARDED_AD_IOS']!;
  static String get privacyPolicyUrl => dotenv.env['PRIVACY_POLICY_URL']!;
  static String get termsOfUse => dotenv.env['TERMS_OF_USE_URL']!;
}
