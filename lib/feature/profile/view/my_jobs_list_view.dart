import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/feature/profile/view_model/my_jobs_view_model.dart';
import 'package:findpro/feature/profile/widget/my_jobs_list_tile.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyJobsListView extends ConsumerWidget {
  const MyJobsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myJobsViewModel = ref.watch(myJobsProvider);
    final myJobsFuture = ref.watch(myJobsFutureProvider);
    return myJobsFuture.when(
      data: (_) {
        if (myJobsViewModel.result == null ||
            myJobsViewModel.result!.isEmpty) {
          return NoDataWidget(
            text: LocaleKeys.noJobsFound.tr(),
          );
        }
        final reversedList = myJobsViewModel.result!.reversed.toList();
        return Stack(
          children: [
            const HomeBackgroundImage(),
            ListView.builder(
                shrinkWrap: true,
                itemCount: myJobsViewModel.result!.length,
                itemBuilder: (context, index) {
                  return MyJobsListTile(jobModel: reversedList[index]);
                }),
          ],
        );
      },
      error: (error, stackTrace) => NoDataWidget(
        text: LocaleKeys.noJobsFound.tr(),
      ),
      loading: () => const CustomCircular(),
    );
  }
}
