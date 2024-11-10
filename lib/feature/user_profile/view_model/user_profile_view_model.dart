import 'package:findpro/common/services/model/response/user_profile_response.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:riverpod/riverpod.dart';

class UserProfileViewModel extends StateNotifier<UserProfileResponse> {
  UserProfileViewModel() : super(UserProfileResponse(success: false));

  Future<bool> getUser(int userId) async {
    final response = await UserService.instance.profile(userId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }
}

final userProfileProvider =
    StateNotifierProvider<UserProfileViewModel, UserProfileResponse>(
        (ref) => UserProfileViewModel());

final userProfileFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success =
        await ref.read(userProfileProvider.notifier).getUser(userId);
    return success;
  },
);
