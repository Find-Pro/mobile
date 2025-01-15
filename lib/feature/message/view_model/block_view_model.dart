import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/block_service.dart';
import 'package:riverpod/riverpod.dart';

class BlockViewModel extends StateNotifier<bool> {
  BlockViewModel() : super(false);

  Future<bool> isBlocked(int userId) async {
    final currentUserId = CacheManager.instance.getUserId();
    final response = await BlockService.instance.list(currentUserId);
    if (response == null || response.isEmpty) {
      return false;
    }
    final isFollowing = response.any((following) => following == userId);
    state = isFollowing;
    return isFollowing;
  }

  Future<bool> block(int userId) async {
    final response = await BlockService.instance.block(userId, true);
    if (response != null && response.success) {
      state = true;
      return true;
    }
    return false;
  }

  Future<bool> unblock(int userId) async {
    final response = await BlockService.instance.block(userId, false);
    if (response != null && response.success) {
      state = false;
      return true;
    }
    return false;
  }
}

final blockProvider =
    StateNotifierProvider<BlockViewModel, bool>((ref) => BlockViewModel());

final blockFutureProvider = FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success =
        await ref.read(blockProvider.notifier).isBlocked(userId);
    return success;
  },
);
