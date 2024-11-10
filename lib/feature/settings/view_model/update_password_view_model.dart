import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class UpdatePasswordViewModel
    extends StateNotifier<SuccessAndMessageResponse> {
  UpdatePasswordViewModel()
      : super(const SuccessAndMessageResponse(success: false));

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> updateProfile(String password) async {
    loadingNotifier.value = true;

    final response = await UserService.instance.updatePassword(password);
    if (response != null) {
      state = response;
      loadingNotifier.value = false;
      return response.success;
    }
    loadingNotifier.value = false;
    return false;
  }

  bool isPasswordMatch(String password, String passwordAgain) {
    if (password == passwordAgain) {
      return true;
    } else {
      return false;
    }
  }
}

final updatePwProvider = StateNotifierProvider<UpdatePasswordViewModel,
    SuccessAndMessageResponse>((ref) => UpdatePasswordViewModel());
