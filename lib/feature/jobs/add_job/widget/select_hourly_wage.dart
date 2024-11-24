import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/hourly_wage_list.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectHourlyWage extends ConsumerWidget {
  const SelectHourlyWage({
    required this.pageController,
    super.key,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addJobViewModel = ref.read(addJobProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          10.verticalSpace,
          Text(
            LocaleKeys.selectHourlyWage.tr(),
            style: context.textTheme.headlineMedium,
          ),
          SizedBox(
            height: DeviceSize.height(context) / 1.5,
            child: ListView.builder(
              itemCount: HourlyWageList.list.length,
              itemBuilder: (context, index) {
                return AddJobListTile(
                    text: HourlyWageList.list[index].toString(),
                    onTap: () {
                      addJobViewModel.hourlyWage =
                          HourlyWageList.list[index];
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
