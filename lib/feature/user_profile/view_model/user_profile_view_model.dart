import 'package:findpro/common/services/model/response/user_profile_response.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class UserProfileViewModel extends StateNotifier<UserProfileResponse> {
  UserProfileViewModel() : super(UserProfileResponse(success: false));

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> getUser() async {
    loadingNotifier.value = true;

    final response = await UserService().profile();
    if (response != null) {
      state = response;
      loadingNotifier.value = false;
      return response.success;
    }
    loadingNotifier.value = false;
    return false;
  }
}

final userProfileProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileResponse>(
        (ref) => UserProfileViewModel());

final userProfileFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(userProfileProvider.notifier).getUser();
    return success;
  },
);
