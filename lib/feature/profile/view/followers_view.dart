import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/profile/widget/follower_list_tile.dart';
import 'package:findpro/feature/profile/widget/following_search_bar.dart';
import 'package:findpro/feature/user_profile/view_model/follower_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FollowersView extends ConsumerWidget {
  const FollowersView(
      {required this.isGeneralProfile, required this.userId, super.key});
  final bool isGeneralProfile;
  final int userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followerFuture = ref.watch(followerFutureProvider(userId));
    final filteredFollowers =
        ref.watch(followerProvider.select((state) => state.result));

    return followerFuture.when(
      data: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              FollowingSearchBar(
                onSearch: (key) {
                  ref.read(followerProvider.notifier).search(key);
                },
              )
            ],
          ),
          body: filteredFollowers == null || filteredFollowers.isEmpty
              ? NoConnectionWidget(
                  text: LocaleKeys.noFollowersFound.tr(),
                )
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
      error: (error, stackTrace) => const NoConnectionWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
