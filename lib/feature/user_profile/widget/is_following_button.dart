import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/services/manager/notification_manager.dart';
import 'package:findpro/common/services/model/response/user/user_profile_response.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/home/view_model/home_view_model.dart';
import 'package:findpro/feature/message/view_model/block_view_model.dart';
import 'package:findpro/feature/profile/view_model/follow_number_box_view_model.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/user_profile/view_model/follow_view_model.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsFollowingButton extends ConsumerWidget {
  const IsFollowingButton({required this.userId, super.key});

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followFuture = ref.watch(followFutureProvider(userId));
    final currentUser = ref.watch(profileProvider);

    final blockViewModel = ref.watch(blockProvider);
    if (blockViewModel) {
      return Text(LocaleKeys.youHaveBlockedUser.tr(),
          style: context.textTheme.headlineSmall!
              .copyWith(color: Colors.red, fontWeight: FontWeight.w500));
    }

    return followFuture.when(
      data: (isFollowing) {
        final isCurrentlyFollowing = ref.watch(followProvider);
        return Padding(
          padding: PaddingInsets().large,
          child: GestureDetector(
            onTap: () => handleFollow(
                context, ref, isCurrentlyFollowing, currentUser),
            child: Container(
              width: DeviceSize.width(context) - 150,
              height: 45,
              decoration: BoxDecoration(
                color: isCurrentlyFollowing ? Colors.cyan : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  isCurrentlyFollowing
                      ? LocaleKeys.unfollow.tr()
                      : LocaleKeys.startFollowing.tr(),
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        debugPrint(error.toString());
        return Text(LocaleKeys.error.tr());
      },
      loading: () => const CustomCircular(),
    );
  }

  Future<void> handleFollow(BuildContext context, WidgetRef ref,
      bool isCurrentlyFollowing, UserProfileResponse currentUser) async {
    final followNotifier = ref.read(followProvider.notifier);
    bool result;
    if (isCurrentlyFollowing) {
      result = await followNotifier.unfollow(userId);
      await ref.read(followNumberBoxProvider.notifier).get(userId);
    } else {
      result = await followNotifier.follow(userId);
      await ref.read(followNumberBoxProvider.notifier).get(userId);
    }
    if (result) {
      await ref.read(profileProvider.notifier).getUser();
      await ref.read(userProfileProvider.notifier).getUser(userId);
      await ref.read(notificationProvider).sendNotification(
            isMessage: false,
            message:
                '${currentUser.user?.fullName ?? LocaleKeys.aFindProUser.tr()} ${LocaleKeys.startedToFollowYou.tr()}',
            receiverId: userId.toString(),
            senderId: currentUser.user!.userId.toString(),
          );
      await ref.read(homeProvider.notifier).getJobs();
      InformationToast().show(
        context,
        isCurrentlyFollowing
            ? LocaleKeys.unfollowedNow.tr()
            : LocaleKeys.followingNow.tr(),
      );
    } else {
      WarningAlert().show(context, LocaleKeys.error.tr(), true);
    }
  }
}
