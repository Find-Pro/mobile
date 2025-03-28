import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/home/view_model/home_view_model.dart';
import 'package:findpro/feature/home/widget/home_app_bar.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/feature/home/widget/home_no_data_widget.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeProvider);
    final homeFuture = ref.watch(homeFutureProvider);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: homeFuture.when(
        data: (_) {
          if (homeViewModel.result!.isEmpty) {
            return HomeNoDataWidget(
              text: LocaleKeys.noFollowingFound.tr(),
            );
          }
          return Stack(
            children: [
              const HomeBackgroundImage(),
              ListView.builder(
                itemCount: homeViewModel.result!.length,
                itemBuilder: (context, index) {
                  return JobListTile(
                      jobModel: homeViewModel.result![index]);
                },
              ),
            ],
          );
        },
        error: (error, stackTrace) => NoDataWidget(
          text: LocaleKeys.noFollowingFound.tr(),
        ),
        loading: () => const CustomCircular(),
      ),
    );
  }
}
