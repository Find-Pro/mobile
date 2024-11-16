import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/user_profile/view_model/follow_view_model.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsFollowingButton extends ConsumerWidget {
  const IsFollowingButton({required this.userId, super.key});

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followFuture = ref.watch(followFutureProvider(userId));
    return followFuture.when(
      data: (isFollowing) {
        final isCurrentlyFollowing = ref.watch(followProvider);
        return Padding(
          padding: PaddingInsets().large,
          child: GestureDetector(
            onTap: () async {
              final followNotifier = ref.read(followProvider.notifier);
              bool result;
              if (isCurrentlyFollowing) {
                result = await followNotifier.unfollow(userId);
              } else {
                result = await followNotifier.follow(userId);
              }
              if (result) {
                await ref.read(profileProvider.notifier).getUser();
                await ref
                    .read(userProfileProvider.notifier)
                    .getUser(userId);

                InformationToast().show(
                  context,
                  isCurrentlyFollowing
                      ? 'unfollowedNow'.tr()
                      : 'followingNow'.tr(),
                );
              } else {
                WarningAlert().show(context, 'error'.tr(), true);
              }
            },
            child: Container(
              width: DeviceSize.width(context) - 150,
              height: 45,
              decoration: BoxDecoration(
                color: isCurrentlyFollowing ? Colors.grey : Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  isCurrentlyFollowing
                      ? 'unfollow'.tr()
                      : 'startFollowing'.tr(),
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text('error'.tr()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
