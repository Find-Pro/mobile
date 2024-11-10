import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/profile/widget/follower_list_tile.dart';
import 'package:findpro/feature/profile/widget/following_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FollowersView extends ConsumerWidget {
  const FollowersView({required this.isGeneralProfile, super.key});
  final bool isGeneralProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileFuture = ref.watch(profileFutureProvider);
    final filteredFollowers = ref
        .watch(profileProvider.select((state) => state.user?.followers));

    return profileFuture.when(
      data: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              FollowingSearchBar(
                  onSearch: (key) => ref
                      .read(profileProvider.notifier)
                      .searchFollowers(key, filteredFollowers, false)),
            ],
          ),
          body: filteredFollowers == null || filteredFollowers.isEmpty
              ? const NoDataFoundWidget()
              : ListView.builder(
                  itemCount: filteredFollowers.length,
                  itemBuilder: (context, index) {
                    final userModel = filteredFollowers[index];
                    return FollowerListTile(
                      isFollowersView: true,
                      followerModel: userModel,
                      currentUserId:
                          ref.read(profileProvider).user!.userId!,
                      isGeneralProfile: isGeneralProfile,
                    );
                  },
                ),
        );
      },
      error: (error, stackTrace) => const NoDataFoundWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
