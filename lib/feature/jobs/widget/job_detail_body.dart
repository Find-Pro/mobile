import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/feature/jobs/view_model/job_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailBody extends ConsumerWidget {
  const JobDetailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobViewModel = ref.watch(jobDetailProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BuildDetailRow(
          iconData: Icons.category,
          bodyText: jobViewModel.result!.jobCategory!,
          titleText: LocaleKeys.category,
        ),
        _BuildDetailRow(
          iconData: Icons.business_center_outlined,
          bodyText: jobViewModel.result!.jobService!,
          titleText: LocaleKeys.service,
        ),
        _BuildDetailRow(
          iconData: Icons.monetization_on,
          bodyText: '${jobViewModel.result!.hourlyWage} ₺',
          titleText: LocaleKeys.hourlyWage,
        ),
        _BuildDetailRow(
          iconData: Icons.calendar_month_sharp,
          bodyText: DateTime.parse(jobViewModel.result!.createdAt!)
              .formattedDate,
          titleText: LocaleKeys.announcementTime,
        ),
        _BuildDetailRow(
          iconData: Icons.location_on_outlined,
          bodyText: jobViewModel.result!.city!,
          titleText: LocaleKeys.city,
        ),
        _BuildDetailRow(
          iconData: Icons.location_searching,
          bodyText: jobViewModel.result!.district!,
          titleText: LocaleKeys.district,
        ),
        _BuildDetailRow(
          iconData: Icons.description_outlined,
          bodyText: jobViewModel.result!.description!,
          titleText: LocaleKeys.description,
        ),
      ],
    );
  }
}

class _BuildDetailRow extends StatelessWidget {
  const _BuildDetailRow({
    required this.iconData,
    required this.titleText,
    required this.bodyText,
  });
  final IconData iconData;
  final String titleText;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Icon(
                iconData,
                color: context.themeData.primaryColor,
                size: 27,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText.toUpperCase(),
                    style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                  15.verticalSpace,
                  Text(
                    bodyText,
                    style: context.textTheme.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }
}
