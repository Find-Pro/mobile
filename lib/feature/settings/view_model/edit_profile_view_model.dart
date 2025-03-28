import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/response/user/update_profile_response.dart';
import 'package:findpro/common/services/routes/user_service.dart';
import 'package:riverpod/riverpod.dart';

class EditProfileViewModel extends StateNotifier<UpdateProfileResponse> {
  EditProfileViewModel()
      : super(const UpdateProfileResponse(success: false));

  Future<bool> updateProfile(String fullName, String email) async {
    final response =
        await UserService.instance.updateProfile(fullName, email);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }

  Future<bool> getUser() async {
    final userId = CacheManager.instance.getUserId();
    final response = await UserService.instance.profile(userId);
    if (response!.success) {
      state = UpdateProfileResponse(
          success: true, message: response.message, user: response.user);

      return response.success;
    }
    return false;
  }
}

final editProfileProvider =
    StateNotifierProvider<EditProfileViewModel, UpdateProfileResponse>(
        (ref) => EditProfileViewModel());

final editProfileFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(editProfileProvider.notifier).getUser();
    return success;
  },
);
