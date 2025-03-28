import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/settings/view_model/select_country_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectCountryFutureProvider);
    final profileFuture = ref.watch(profileFutureProvider);
    final currentCountry = ref.watch(selectCountryProvider);
    final currentUser = ref.watch(profileProvider);
    return profileFuture.when(
      data: (_) {
        return AppBar(
          backgroundColor: Colors.teal.shade600,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade400,
                  Colors.teal.shade600,
                  Colors.teal.shade400
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (CacheManager.instance.getUserId() != 0)
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        CreateImageUrl.instance
                            .photo(currentUser.user!.profilePicture!),
                      ),
                    ),
                    10.horizontalSpace,
                    Text(
                      currentUser.user!.fullName ?? '',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              GestureDetector(
                onTap: () => context.router
                    .push(SelectCountryRoute(isSettingsView: true)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      GetCountryFlag().getSvgPath(currentCountry),
                      height: 30,
                    ),
                    8.horizontalSpace,
                    Text(
                      GetCountryStringFromCode().get(currentCountry),
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        );
      },
      error: (error, stackTrace) => NoDataWidget(
        text: LocaleKeys.noDataFound.tr(),
      ),
      loading: () => const CustomCircular(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
