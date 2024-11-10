import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/auth_service.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class RegisterViewModel extends StateNotifier<UpdateProfileResponse> {
  RegisterViewModel() : super(const UpdateProfileResponse(success: false));

  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> register(RegisterRequest request) async {
    loadingNotifier.value = true;
    final response = await AuthService.instance.register(request);
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

final registerProvider =
    StateNotifierProvider<RegisterViewModel, UpdateProfileResponse>(
        (ref) => RegisterViewModel());
