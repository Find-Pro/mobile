import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/follow_service.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:riverpod/riverpod.dart';

// takip ettiğim state = kullanıcıyı takip edip etmemem
//true = takip ediyorum
//false = takip etmiyorum
class FollowViewModel extends StateNotifier<bool> {
  FollowViewModel() : super(false);
  Ref? ref;
  Future<bool> isFollowing(int userId) async {
    final currentUserId = CacheManager.instance.getUserId();
    final profileResponse =
        await UserService.instance.profile(currentUserId);
    if (profileResponse?.user == null) {
      return false;
    }

    final isFollowing = profileResponse!.user!.followings
            ?.any((following) => following.userId == userId) ??
        false;

    state = isFollowing;
    return isFollowing;
  }

  Future<bool> follow(int userId) async {
    final currentUserId = CacheManager.instance.getUserId();
    final response =
        await FollowService.instance.follow(currentUserId, userId, true);
    if (response != null && response.success) {
      state = true;
      return true;
    }
    return false;
  }

  Future<bool> unfollow(int userId) async {
    final currentUserId = CacheManager.instance.getUserId();
    final response =
        await FollowService.instance.follow(currentUserId, userId, false);
    if (response != null && response.success) {
      state = false;
      return true;
    }
    return false;
  }
}

final followProvider = StateNotifierProvider<FollowViewModel, bool>(
    (ref) => FollowViewModel());

final followFutureProvider = FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success =
        await ref.read(followProvider.notifier).isFollowing(userId);
    return success;
  },
);
