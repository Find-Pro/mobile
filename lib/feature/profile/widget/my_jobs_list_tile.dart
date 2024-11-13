import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/question_alert.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/get_category_icon.dart';
import 'package:findpro/feature/profile/view_model/my_jobs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MyJobsListTile extends ConsumerWidget {
  const MyJobsListTile({
    required this.jobModel,
    super.key,
  });
  final JobModel jobModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: PaddingInsets().medium,
      child: Card(
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
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: context.themeData.dividerColor),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () async {
                    QuestionAlert().show(
                        context, LocaleKeys.areYouSureDeleteJob, () async {
                      final res = await ref
                          .read(myJobsProvider.notifier)
                          .deleteJob(jobModel.jobId!);
                      if (res) {
                        InformationToast().show(context,
                            LocaleKeys.commentDeletedSuccessfully);
                      } else {
                        InformationToast()
                            .show(context, LocaleKeys.anErrorOccurred);
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
