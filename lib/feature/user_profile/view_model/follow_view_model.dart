import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/follow_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class FollowViewModel extends StateNotifier<bool> {
  FollowViewModel() : super(false);

  Future<bool> isFollowing(int userId) async {
    final currentUserId = CacheManager.instance.getUserId();
    final response = await FollowService.instance.following(currentUserId);
    if (response?.result == null) {
      return false;
    }
    final isFollowing =
        response!.result!.any((following) => following.userId == userId);

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
    try {
      final success =
          await ref.read(followProvider.notifier).isFollowing(userId);

      return success;
    } catch (e, stackTrace) {
      debugPrint('followFutureProvider error: $e');
      debugPrint('StackTrace: $stackTrace');
      return false;
    }
  },
);
