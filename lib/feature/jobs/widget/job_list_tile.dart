import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/model/response/job/string_job_model.dart';
import 'package:findpro/common/widget/custom_future_builder.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/get_category_icon.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
import 'package:findpro/feature/jobs/view_model/saved_jobs_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class JobListTile extends ConsumerWidget {
  const JobListTile({required this.jobModel, super.key});

  final JobModel jobModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobs = ref.watch(savedJobsProvider);
    final savedJobsVM = ref.read(savedJobsProvider.notifier);
    final isSaved = savedJobs.any((job) => job.jobId == jobModel.jobId);
    return CustomFutureBuilder<StringJobModel>(
      future: JobDetailHelper.instance.convert(jobModel),
      child: (stringJobModel) => GestureDetector(
        onTap: () =>
            context.router.push(JobDetailRoute(jobModel: jobModel)),
        child: Padding(
          padding: PaddingInsets().xl,
          child: SizedBox(
            height: 130,
            child: Card(
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            GetCategoryIcon()
                                .get(jobModel.jobCategoryId ?? 1),
                            colorFilter: const ColorFilter.mode(
                              Colors.blueAccent,
                              BlendMode.srcATop,
                            ),
                            width: 50,
                            height: 50,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    stringJobModel.service!,
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    stringJobModel.category!,
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color:
                                          context.themeData.dividerColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: SvgPicture.asset(
                                      GetCountryFlag().getSvgPath(
                                          stringJobModel.country!),
                                      height: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    isSaved
                                        ? savedJobsVM
                                            .removeJob(jobModel.jobId!)
                                        : savedJobsVM
                                            .saveJob(jobModel.jobId!);
                                  },
                                  icon: Icon(
                                    isSaved
                                        ? Icons.bookmark_added
                                        : Icons.bookmark_add_outlined,
                                    color: Colors.blueAccent,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '${jobModel.hourlyWage?.toString() ?? '0'} \$${LocaleKeys.perHour.tr()}',
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.themeData.dividerColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${stringJobModel.city}/${stringJobModel.district}',
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.themeData.dividerColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DateTime.parse(jobModel.createdAt!)
                                .formattedDate,
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.themeData.dividerColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
