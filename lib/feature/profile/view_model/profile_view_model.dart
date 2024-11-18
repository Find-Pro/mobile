import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/response/user_profile_response.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:riverpod/riverpod.dart';

class ProfileViewModel extends StateNotifier<UserProfileResponse> {
  ProfileViewModel() : super(UserProfileResponse(success: false));

  Future<bool> getUser() async {
    final userId = CacheManager.instance.getUserId();
    final response = await UserService.instance.profile(userId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }
}

final profileProvider =
    StateNotifierProvider<ProfileViewModel, UserProfileResponse>(
        (ref) => ProfileViewModel());

final profileFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(profileProvider.notifier).getUser();
    return success;
  },
);
