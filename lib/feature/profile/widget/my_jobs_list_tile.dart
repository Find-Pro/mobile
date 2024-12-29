import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/get_category_icon.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
import 'package:findpro/feature/profile/view_model/my_jobs_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
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
    return FutureBuilder(
        future: JobDetailHelper.instance.convert(jobModel),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomCircular();
          } else if (snapshot.hasError) {
            return Text(
              LocaleKeys.error.tr(),
              style: context.textTheme.labelMedium,
            );
          } else {
            final stringJobModel = snapshot.data!;
            return Padding(
              padding: PaddingInsets().medium,
              child: Card(
                elevation: 0.5,
                child: Padding(
                  padding: PaddingInsets().large,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        GetCategoryIcon().get(jobModel.jobCategoryId ?? 1),
                        colorFilter: const ColorFilter.mode(
                          Colors.blueAccent,
                          BlendMode.srcATop,
                        ),
                        width: 30,
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stringJobModel.service!,
                            style: context.textTheme.labelLarge
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '${stringJobModel.city!}/${stringJobModel.district!}',
                            style: context.textTheme.labelMedium?.copyWith(
                                color: context.themeData.dividerColor),
                          ),
                          Text(
                            DateTime.parse(jobModel.createdAt!)
                                .formattedDate,
                            style: context.textTheme.labelMedium?.copyWith(
                                color: context.themeData.dividerColor),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () async {
                            await QuestionAlertDialog().show(context,
                                bodyText:
                                    LocaleKeys.areYouSureDeleteJob.tr(),
                                buttonText: LocaleKeys.delete.tr(),
                                onTap: () async {
                              final res = await ref
                                  .read(myJobsProvider.notifier)
                                  .deleteJob(jobModel.jobId!);
                              await context.router.pop();
                              if (res) {
                                InformationToast().show(context,
                                    LocaleKeys.jobDeletedSuccess.tr());
                                ref.invalidate(myJobsProvider);
                              } else {
                                InformationToast().show(context,
                                    LocaleKeys.anErrorOccurred.tr());
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
        });
  }
}
