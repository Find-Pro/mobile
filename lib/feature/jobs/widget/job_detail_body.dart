import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/date_time_extension.dart';
import 'package:findpro/common/services/model/response/string_job_model.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailBody extends ConsumerWidget {
  const JobDetailBody({required this.jobModel, super.key});
  final StringJobModel jobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BuildDetailRow(
          iconData: Icons.category,
          bodyText: jobModel.category!,
          titleText: LocaleKeys.category.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.business_center_outlined,
          bodyText: jobModel.service!,
          titleText: LocaleKeys.service.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.monetization_on,
          bodyText: '${jobModel.hourlyWage} \$',
          titleText: LocaleKeys.hourlyWage.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.calendar_month_sharp,
          bodyText: DateTime.parse(jobModel.createdAt!).formattedDate,
          titleText: LocaleKeys.announcementTime.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.language,
          bodyText: GetCountryStringFromCode().get(jobModel.country!),
          titleText: LocaleKeys.country.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.location_on_outlined,
          bodyText: jobModel.city!,
          titleText: LocaleKeys.city.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.location_searching,
          bodyText: jobModel.district!,
          titleText: LocaleKeys.district.tr(),
        ),
        _BuildDetailRow(
          iconData: Icons.description_outlined,
          bodyText: jobModel.description!,
          titleText: LocaleKeys.description.tr(),
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
                color: Colors.blueAccent,
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
        const Divider(
          thickness: 0.7,
        ),
      ],
    );
  }
}
