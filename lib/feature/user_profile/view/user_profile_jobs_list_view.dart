import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_jobs_list_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileJobsListView extends ConsumerWidget {
  const UserProfileJobsListView({
    required this.userId,
    super.key,
  });
  final int userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileJobsViewModel = ref.watch(userProfileJobsProvider);
    final userProfileJobsFuture =
        ref.watch(userProfileJobsFutureProvider(userId));
    return userProfileJobsFuture.when(
      data: (_) {
        if (userProfileJobsViewModel.result == null ||
            userProfileJobsViewModel.result!.isEmpty) {
          return NoDataWidget(
            text: LocaleKeys.noJobsFound.tr(),
          );
        }
        return Stack(
          children: [
            const HomeBackgroundImage(),
            ListView.builder(
                itemCount: userProfileJobsViewModel.result!.length,
                itemBuilder: (context, index) {
                  return JobListTile(
                      jobModel: userProfileJobsViewModel.result![index]);
                }),
          ],
        );
      },
      error: (error, stackTrace) => const NoDataWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
