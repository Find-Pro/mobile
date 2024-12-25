import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:findpro/common/services/routes/auth_service.dart';
import 'package:findpro/generated/locale_keys.g.dart';

final class LoginViewModel {
  Future<UpdateProfileResponse> login(LoginRequest request) async {
    final response = await AuthService.instance.login(request);
    if (response == null) {
      return UpdateProfileResponse(
          success: false,
          message: response?.message ?? LocaleKeys.error.tr());
    }

    if (response.success) {
      CacheManager.instance.setUserId(response.user!.userId!);
      return response;
    }

    return UpdateProfileResponse(
        success: false, message: response.message);
  }
}
