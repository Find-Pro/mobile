import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/platform_extension.dart';
import 'package:findpro/common/services/model/response/job/string_job_model.dart';
import 'package:findpro/common/widget/custom_future_builder.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
import 'package:findpro/feature/jobs/view_model/saved_jobs_view_model.dart';
import 'package:findpro/feature/jobs/widget/job_detail_body.dart';
import 'package:findpro/feature/jobs/widget/job_detail_user_tile.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class JobDetailView extends ConsumerWidget {
  const JobDetailView({required this.jobModel, super.key});

  final JobModel jobModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _JobDetailAppBar(jobModel: jobModel),
      body: CustomFutureBuilder<StringJobModel>(
        future: JobDetailHelper.instance.convert(jobModel),
        child: (stringJobModel) => SingleChildScrollView(
          child: Column(
            children: [
              JobDetailUserTile(jobModel: stringJobModel),
              JobDetailBody(jobModel: stringJobModel),
            ],
          ),
        ),
      ),
    );
  }
}

class _JobDetailAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const _JobDetailAppBar({
    required this.jobModel,
  });

  final JobModel jobModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobs = ref.watch(savedJobsProvider);
    final savedJobsVM = ref.read(savedJobsProvider.notifier);
    final isSaved = savedJobs.any((job) => job.jobId == jobModel.jobId);
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              context.platform == PlatformExtension.iOS
                  ? Icons.arrow_back_ios
                  : Icons.arrow_back,
              color: context.themeData.indicatorColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Text(
              LocaleKeys.serviceDetails.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              isSaved
                  ? savedJobsVM.removeJob(jobModel.jobId!)
                  : savedJobsVM.saveJob(jobModel.jobId!);
            },
            icon: Icon(
              isSaved ? Icons.bookmark_added : Icons.bookmark_add_outlined,
              color: Colors.blueAccent,
              size: 30,
            ),
          ),
        ],
      ),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
