import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/auth_service.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:riverpod/riverpod.dart';

class LoginViewModel extends StateNotifier<UpdateProfileResponse> {
  LoginViewModel() : super(const UpdateProfileResponse(success: false));

  Future<UpdateProfileResponse> login(LoginRequest request) async {
    final response = await AuthService.instance.login(request);
    if (response == null) {
      return UpdateProfileResponse(
          success: false, message: response?.message ?? 'error'.tr());
    }

    if (response.success) {
      CacheManager.instance.setUserId(response.user!.userId!);
      state = response;
      return response;
    }

    return UpdateProfileResponse(
        success: false, message: response.message);
  }
}

final loginProvider =
    StateNotifierProvider<LoginViewModel, UpdateProfileResponse>(
        (ref) => LoginViewModel());
