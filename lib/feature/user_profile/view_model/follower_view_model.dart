import 'package:findpro/common/services/model/response/follow_list_response.dart';
import 'package:findpro/common/services/routes/follow_service.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:riverpod/riverpod.dart';

class FollowerViewModel extends StateNotifier<FollowListResponse> {
  FollowerViewModel() : super(FollowListResponse());

  List<FollowerModel>? filteredFollowers;

  Future<bool> get(int userId) async {
    final response = await FollowService.instance.followers(userId);
    if (response != null) {
      state = response;
      filteredFollowers = response.result;
      if (response.success!) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void search(String key) {
    filteredFollowers = state.result?.where((user) {
      final fullName = user.fullName?.toLowerCase() ?? '';
      return fullName.contains(key.toLowerCase());
    }).toList();

    state = state.copyWith(
      result: filteredFollowers,
    );
  }
}

final followerProvider =
    StateNotifierProvider<FollowerViewModel, FollowListResponse>(
        (ref) => FollowerViewModel());

final followerFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success = await ref.read(followerProvider.notifier).get(userId);
    return success;
  },
);
