import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/routes/user_service.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:riverpod/riverpod.dart';

class ChangePasswordViewModel
    extends StateNotifier<SuccessAndMessageResponse> {
  ChangePasswordViewModel()
      : super(const SuccessAndMessageResponse(success: false));

  Future<SuccessAndMessageResponse> change(String password) async {
    final response = await UserService.instance.updatePassword(password);
    if (response != null) {
      state = response;
      return response;
    } else {
      return SuccessAndMessageResponse(
          success: false, message: LocaleKeys.error.tr());
    }
  }
}

final changePasswordProvider = StateNotifierProvider<
    ChangePasswordViewModel,
    SuccessAndMessageResponse>((ref) => ChangePasswordViewModel());
