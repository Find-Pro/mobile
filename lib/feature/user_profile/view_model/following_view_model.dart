import 'package:findpro/common/services/model/response/follow/follow_list_response.dart';
import 'package:findpro/common/services/routes/follow_service.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:riverpod/riverpod.dart';

class FollowingViewModel extends StateNotifier<FollowListResponse> {
  FollowingViewModel() : super(FollowListResponse());

  List<FollowerModel>? filteredFollowings;

  Future<bool> get(int userId) async {
    final response = await FollowService.instance.following(userId);
    if (response != null) {
      state = response;
      filteredFollowings = response.result;
      if (response.success!) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void search(String key) {
    filteredFollowings = state.result?.where((user) {
      final fullName = user.fullName?.toLowerCase() ?? '';
      return fullName.contains(key.toLowerCase());
    }).toList();

    state = state.copyWith(
      result: filteredFollowings,
    );
  }
}

final followingProvider =
    StateNotifierProvider<FollowingViewModel, FollowListResponse>(
        (ref) => FollowingViewModel());

final followingFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success = await ref.read(followingProvider.notifier).get(userId);
    return success;
  },
);
