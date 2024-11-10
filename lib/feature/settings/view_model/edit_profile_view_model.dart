import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class EditProfileViewModel extends StateNotifier<UpdateProfileResponse> {
  EditProfileViewModel()
      : super(const UpdateProfileResponse(success: false));

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> updateProfile(UserModel updateUser) async {
    loadingNotifier.value = true;
    final response = await UserService.instance.updateProfile(updateUser);
    if (response != null) {
      state = response;
      loadingNotifier.value = false;
      return response.success;
    }
    loadingNotifier.value = false;
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
