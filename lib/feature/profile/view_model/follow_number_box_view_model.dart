import 'package:findpro/common/services/follow_service.dart';
import 'package:findpro/feature/profile/model/follow_number_box_model.dart';
import 'package:riverpod/riverpod.dart';

class FollowingViewModel extends StateNotifier<FollowNumberBoxModel> {
  FollowingViewModel() : super(FollowNumberBoxModel());

  Future<bool> get(int userId) async {
    final response = await FollowService.instance.count(userId);
    if (response != null) {
      state = response;
      if (response.success!) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}

final followNumberBoxProvider =
    StateNotifierProvider<FollowingViewModel, FollowNumberBoxModel>(
        (ref) => FollowingViewModel());

final followNumberBoxFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success =
        await ref.read(followNumberBoxProvider.notifier).get(userId);
    return success;
  },
);
