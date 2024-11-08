import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/profile/widget/follower_list_tile.dart';
import 'package:findpro/feature/profile/widget/following_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FollowersView extends ConsumerStatefulWidget {
  const FollowersView({required this.isGeneralProfile, super.key});
  final bool isGeneralProfile;

  @override
  ConsumerState createState() => _FollowersViewState();
}

class _FollowersViewState extends ConsumerState<FollowersView> {
  List<FollowerModel>? filteredUsers;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final followers = ref.read(profileProvider).user?.followers;
      setState(() {
        filteredUsers = followers ?? [];
      });
    });
  }

  void onSearch(String key) {
    final followers = ref.read(profileProvider).user?.followers;
    if (key.isEmpty) {
      filteredUsers = followers;
    } else {
      filteredUsers = followers?.where((user) {
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
                      isFollowersView: true,
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
