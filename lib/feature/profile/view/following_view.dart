import 'package:auto_route/annotations.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/profile/widget/follower_list_tile.dart';
import 'package:findpro/feature/profile/widget/following_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FollowingView extends ConsumerStatefulWidget {
  const FollowingView({required this.isGeneralProfile, super.key});
  final bool isGeneralProfile;

  @override
  ConsumerState createState() => _FollowingViewState();
}

class _FollowingViewState extends ConsumerState<FollowingView> {
  List<FollowerModel>? filteredUsers;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final followings = ref.read(profileProvider).user?.followings;
      setState(() {
        filteredUsers = followings ?? [];
      });
    });
  }

  void onSearch(String key) {
    final followings = ref.read(profileProvider).user?.followings;
    if (key.isEmpty) {
      filteredUsers = followings;
    } else {
      filteredUsers = followings?.where((user) {
        final fullName = user.fullName!.toLowerCase();
        return fullName.contains(key.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final profileFuture = ref.watch(profileFutureProvider);
    return profileFuture.when(
      data: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              FollowingSearchBar(onSearch: onSearch),
            ],
          ),
          body: filteredUsers == null || filteredUsers!.isEmpty
              ? const NoConnectionWidget()
              : ListView.builder(
                  itemCount: filteredUsers!.length,
                  itemBuilder: (context, index) {
                    final userModel = filteredUsers![index];
                    return FollowerListTile(
                      isFollowersView: false,
                      followerModel: userModel,
                      currentUserId:
                          ref.read(profileProvider).user!.userId!,
                      isGeneralProfile: widget.isGeneralProfile,
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
