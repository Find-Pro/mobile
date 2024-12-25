import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/user_service.dart';
import 'package:riverpod/riverpod.dart';

class SelectCountryViewModel extends StateNotifier<String> {
  SelectCountryViewModel() : super('');

  Future<bool> getCountry() async {
    final usersLocalCountry = CacheManager.instance.getCountry();
    final userId = CacheManager.instance.getUserId();
    final res = await UserService.instance.profile(userId);
    if (usersLocalCountry != null) {
      state = usersLocalCountry;
      return true;
    } else {
      if (res != null) {
        state = res.user!.country!;
        return res.success;
      }
    }
    return false;
  }

  Future<bool> setCountry(String country) async {
    final res = await UserService.instance.updateCountry(country);
    if (res != null && res.success) {
      CacheManager.instance.setCountry(country);
      return true;
    } else {
      return false;
    }
  }
}

final selectCountryProvider =
    StateNotifierProvider<SelectCountryViewModel, String>(
        (ref) => SelectCountryViewModel());

final selectCountryFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success =
        await ref.read(selectCountryProvider.notifier).getCountry();
    return success;
  },
);
