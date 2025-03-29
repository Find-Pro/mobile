import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/view_model/my_jobs_view_model.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/settings/view_model/select_country_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          elevation: 0,
          title: Row(
            children: [
              if (CacheManager.instance.getUserId() != 0)
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            child: CircleAvatar(
                          radius: 30,
                          backgroundImage: CachedNetworkImageProvider(
                            CreateImageUrl.instance
                                .photo(currentUser.user!.profilePicture!),
                          ),
                        )),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.haveANiceDay.tr(),
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            //  color: Colors.white70,
                                            ),
                                  ),
                                  Text(
                                    currentUser.user!.fullName ?? '',
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      // color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )),
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => context.router
                        .push(SelectCountryRoute(isSettingsView: true)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    GetCountryFlag()
                                        .getSvgPath(currentCountry),
                                    height: 25,
                                  ),
                                  Text(
                                    GetCountryStringFromCode()
                                        .get(currentCountry),
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: IconButton(
                                onPressed: () {
                                  final jobCount = ref
                                          .watch(myJobsProvider)
                                          .result
                                          ?.length ??
                                      0;
                                  if (jobCount >= 2) {
                                    WarningAlert().show(
                                        context,
                                        LocaleKeys.everyoneHasTheRight
                                            .tr(),
                                        true);
                                  } else {
                                    context.router
                                        .push(const AddJobRoute());
                                  }
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                  color: context.themeData.indicatorColor,
                                )),
                          ))
                        ],
                      ),
                    ),
                  )),
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
