import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/auth_service.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class LoginViewModel extends StateNotifier<UpdateProfileResponse> {
  LoginViewModel() : super(const UpdateProfileResponse(success: false));

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> login(LoginRequest request) async {
    loadingNotifier.value = true;

    final response = await AuthService.instance.login(request);
    if (response!.success) {
      CacheManager.instance.setUserId(response.user!.userId!);
      state = response;
      loadingNotifier.value = false;
      return response.success;
    }
    loadingNotifier.value = false;
    return false;
  }
}

final loginProvider =
    StateNotifierProvider<LoginViewModel, UpdateProfileResponse>(
        (ref) => LoginViewModel());

final loginFutureProvider =
    FutureProvider.autoDispose.family<bool, LoginRequest>(
  (ref, request) async {
    final success = await ref.read(loginProvider.notifier).login(request);
    return success;
  },
);
