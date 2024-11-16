import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/get_category_icon.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobListTile extends StatelessWidget {
  const JobListTile({required this.jobModel, super.key});
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().xl,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                GetCategoryIcon().get(jobModel.jobCategoryId ?? 1),
                colorFilter: const ColorFilter.mode(
                  Colors.blueAccent,
                  BlendMode.srcATop,
                ),
                width: 25,
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobModel.jobService!,
                    style: context.textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '${jobModel.city!}/${jobModel.district!}',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: context.themeData.dividerColor),
                  ),
                  Text(
                    DateTime.parse(jobModel.createdAt!).formattedDate,
                    style: context.textTheme.labelMedium?.copyWith(
                        color: context.themeData.dividerColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '₺${jobModel.hourlyWage?.toString() ?? '0'}',
                    style: context.textTheme.labelLarge,
                  ),
                  JobListTileButton(
                      onTap: () => context.router
                          .push(JobDetailRoute(jobId: jobModel.jobId!))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
