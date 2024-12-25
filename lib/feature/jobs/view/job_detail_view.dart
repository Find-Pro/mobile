import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/feature/home/widget/main_app_bar.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
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
      appBar: MainAppBar(text: LocaleKeys.serviceDetails.tr()),
      body: FutureBuilder(
          future: JobDetailHelper.instance.convert(jobModel),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomCircular();
            } else {
              final stringJobModel = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    JobDetailUserTile(jobModel: stringJobModel),
                    JobDetailBody(jobModel: stringJobModel),
                  ],
                ),
              );
            }
          }),
    );
  }
}
