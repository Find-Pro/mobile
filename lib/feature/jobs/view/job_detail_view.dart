import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/jobs/view_model/job_detail_view_model.dart';
import 'package:findpro/feature/jobs/widget/job_detail_body.dart';
import 'package:findpro/feature/jobs/widget/job_detail_user_tile.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class JobDetailView extends ConsumerWidget {
  const JobDetailView({required this.jobId, super.key});
  final int jobId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobFuture = ref.watch(jobDetailFutureProvider(jobId));
    final jobViewModel = ref.watch(jobDetailProvider);
    return Scaffold(
      appBar: SettingsAppBar(text: LocaleKeys.serviceDetails.tr()),
      body: jobFuture.when(
        data: (_) {
          if (jobViewModel.result == null) {
            return const NoConnectionWidget();
          }
          return const SingleChildScrollView(
            child: Column(
              children: [
                JobDetailUserTile(),
                JobDetailBody(),
              ],
            ),
          );
        },
        loading: () => const CustomCircular(),
        error: (error, stackTrace) => const NoConnectionWidget(),
      ),
    );
  }
}
