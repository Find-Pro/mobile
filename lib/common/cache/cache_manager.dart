import 'package:shared_preferences/shared_preferences.dart';

final class CacheManager {
  CacheManager._init();

  late SharedPreferences prefs;
  static final CacheManager _instance = CacheManager._init();

  static CacheManager get instance => _instance;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  int getUserId({int defaultValue = 0}) {
    return prefs.getInt('userId') ?? defaultValue;
  }

  void setUserId(int value) {
    prefs.setInt('userId', value);
  }

  String? getCountry() {
    return prefs.getString('country');
  }

  void setCountry(String value) {
    prefs.setString('country', value);
  }

  List<String> getSavedJobs() {
    return prefs.getStringList('savedJobs') ?? [];
  }

  void saveJob(String jobId) {
    final savedJobs = getSavedJobs();
    if (!savedJobs.contains(jobId)) {
      savedJobs.add(jobId);
      prefs.setStringList('savedJobs', savedJobs);
    }
  }

  void removeJob(String jobId) {
    final savedJobs = getSavedJobs()..remove(jobId);
    prefs.setStringList('savedJobs', savedJobs);
  }

  void clearJobs() {
    prefs.remove('savedJobs');
  }

//clear cache
  void clearCache() {
    prefs.clear();
  }
}
