import 'package:shared_preferences/shared_preferences.dart';

final class CacheManager {
  CacheManager._init();
  late SharedPreferences prefs;
  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

// user id
  int getUserId({int defaultValue = 0}) {
    return prefs.getInt('userId') ?? defaultValue;
  }

  void setUserId(int value) {
    prefs.setInt('userId', value);
  }

  //register/login with google or apple
  bool? getAppleOrGoogle({bool defaultValue = false}) {
    return prefs.getBool('appleOrGoogle') ?? defaultValue;
  }

  void setAppleOrGoogle(bool value) {
    prefs.setBool('appleOrGoogle', value);
  }

  void clearCache(String key) {
    prefs.clear();
  }
}
