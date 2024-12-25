import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/get_category_icon.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile_button.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class JobListTile extends ConsumerWidget {
  const JobListTile(
      {required this.jobModel,
      required this.isUserProfileView,
      super.key});
  final JobModel jobModel;
  final bool isUserProfileView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: JobDetailHelper.instance.convert(jobModel),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomCircular();
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Text(
                '${LocaleKeys.error.tr()} : ${snapshot.error}',
                style: context.textTheme.headlineSmall,
              ),
            );
          } else {
            final stringJobModel = snapshot.data!;
            return Padding(
              padding: PaddingInsets().xl,
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
                            '${stringJobModel.city}/${stringJobModel.district}',
                            style: context.textTheme.labelMedium?.copyWith(
                                color: context.themeData.dividerColor),
                          ),
                          Text(
                            DateTime.parse(jobModel.createdAt!)
                                .formattedDate,
                            style: context.textTheme.labelMedium?.copyWith(
                                color: context.themeData.dividerColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${jobModel.hourlyWage?.toString() ?? '0'} \$ ',
                            style: context.textTheme.labelLarge,
                          ),
                          if (!isUserProfileView)
                            JobListTileButton(
                                onTap: () => context.router.push(
                                    JobDetailRoute(jobModel: jobModel))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
