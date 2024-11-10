import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:flutter/material.dart';

class JobListTile extends StatelessWidget {
  const JobListTile({required this.jobModel, super.key});
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().medium,
      child: Card(
        child: ListTile(
          style: ListTileStyle.drawer,
          onTap: () =>
              context.router.push(JobDetailRoute(jobId: jobModel.jobId!)),
          leading: Text(
            jobModel.district!,
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          title: Text(
            jobModel.jobService!,
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            jobModel.description!,
            style: context.textTheme.headlineSmall,
          ),
          trailing: Text(
            jobModel.hourlyWage?.toString() ?? '0',
            style: context.textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
