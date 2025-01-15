import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/block_service.dart';
import 'package:riverpod/riverpod.dart';

class IsUserBlockedMeViewModel extends StateNotifier<bool> {
  IsUserBlockedMeViewModel() : super(false);

  Future<bool> check(int userId) async {
    final myUserId = CacheManager.instance.getUserId();
    final blockedUserIds = await BlockService.instance.list(userId);
    if (blockedUserIds != null && blockedUserIds.contains(myUserId)) {
      state = true;
      return true;
    }
    state = false;
    return false;
  }
}

final isUserBlockedMeProvider =
    StateNotifierProvider<IsUserBlockedMeViewModel, bool>(
        (ref) => IsUserBlockedMeViewModel());

final isUserBlockedMeFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success =
        await ref.read(isUserBlockedMeProvider.notifier).check(userId);
    return success;
  },
);
