import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/feature/settings/view_model/select_country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCountryAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const HomeCountryAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectCountryFutureProvider);
    final currentCountry = ref.watch(selectCountryProvider);
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 60,
            child: SvgPicture.asset(
              GetCountryFlag().getSvgPath(currentCountry),
              height: 40,
            ),
          ),
          10.horizontalSpace,
          Text(
            GetCountryStringFromCode().get(currentCountry),
            style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.normal, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.grey.shade700,
      elevation: 4,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 10);
}
