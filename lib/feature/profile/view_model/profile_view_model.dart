import 'package:findpro/common/services/model/response/user_profile_response.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class ProfileViewModel extends StateNotifier<UserProfileResponse> {
  ProfileViewModel() : super(UserProfileResponse());

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> getUser() async {
    loadingNotifier.value = true;

    final response = await UserService().profile();
    if (response != null) {
      state = response;
      loadingNotifier.value = false;
      return response.success ?? false;
    }
    loadingNotifier.value = false;
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
