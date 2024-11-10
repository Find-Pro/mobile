import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/response/user_profile_response.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class ProfileViewModel extends StateNotifier<UserProfileResponse> {
  ProfileViewModel() : super(UserProfileResponse(success: false));

  final loadingNotifier = ValueNotifier<bool>(false);

  List<FollowerModel>? filteredFollowers;

  Future<bool> getUser() async {
    loadingNotifier.value = true;
    final userId = CacheManager.instance.getUserId();
    final response = await UserService.instance.profile(userId);
    if (response != null) {
      state = response;
      filteredFollowers = response.user?.followers ?? [];
      loadingNotifier.value = false;
      return response.success;
    }
    loadingNotifier.value = false;
    return false;
  }

  void searchFollowers(String key, List<FollowerModel>? listToSearch,
      bool isFollowingSearch) {
    if (key.isEmpty) {
      filteredFollowers = listToSearch;
    } else {
      filteredFollowers = listToSearch?.where((user) {
        final fullName = user.fullName!.toLowerCase();
        return fullName.contains(key.toLowerCase());
      }).toList();
    }
    state = isFollowingSearch
        ? state.copyWith(
            user: state.user?.copyWith(followings: filteredFollowers))
        : state.copyWith(
            user: state.user?.copyWith(followers: filteredFollowers));
  }
}

final profileProvider =
    StateNotifierProvider<ProfileViewModel, UserProfileResponse>(
        (ref) => ProfileViewModel());

final profileFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(profileProvider.notifier).getUser();
    return success;
  },
);
