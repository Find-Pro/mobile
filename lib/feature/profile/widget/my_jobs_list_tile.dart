import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/profile/view_model/my_jobs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyJobsListTile extends ConsumerWidget {
  const MyJobsListTile({
    required this.jobModel,
    super.key,
  });
  final JobModel jobModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: PaddingInsets().medium,
        child: ListTile(
          leading: Text(
            jobModel.jobService!,
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          title: Text(
            jobModel.district!,
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            jobModel.description ?? LocaleKeys.undefined,
            style: context.textTheme.labelLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
              onPressed: () async {
                final res = await ref
                    .read(myJobsProvider.notifier)
                    .deleteJob(jobModel.jobId!);
                if (res) {
                  InformationToast().show(
                      context, LocaleKeys.commentDeletedSuccessfully);
                } else {
                  InformationToast()
                      .show(context, LocaleKeys.anErrorOccurred);
                }
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
