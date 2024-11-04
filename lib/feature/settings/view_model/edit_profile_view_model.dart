import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class EditProfileViewModel extends StateNotifier<UpdateProfileResponse> {
  EditProfileViewModel() : super(const UpdateProfileResponse());

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> updateProfile(UserModel updateUser) async {
    loadingNotifier.value = true;

    final response = await UserService().updateProfile(updateUser);
    if (response != null) {
      state = response;
      loadingNotifier.value = false;
      return response.success ?? false;
    }
    loadingNotifier.value = false;
    return false;
  }
}

final editProfileProvider =
    StateNotifierProvider<EditProfileViewModel, UpdateProfileResponse>(
        (ref) => EditProfileViewModel());
