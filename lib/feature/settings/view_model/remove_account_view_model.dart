import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/routes/user_service.dart';
import 'package:riverpod/riverpod.dart';

class RemoveAccountViewModel
    extends StateNotifier<SuccessAndMessageResponse> {
  RemoveAccountViewModel()
      : super(const SuccessAndMessageResponse(success: false));

  Future<bool> remove() async {
    final response = await UserService.instance.removeAccount();
    if (response != null) {
      CacheManager.instance.clearCache();
      state = response;
      return response.success;
    }
    return false;
  }
}

final removeAccountProvider = StateNotifierProvider<RemoveAccountViewModel,
    SuccessAndMessageResponse>((ref) => RemoveAccountViewModel());
