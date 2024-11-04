import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part '../widget/profile_app_bar.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final profileViewModel = ref.watch(profileProvider);
    final profileFuture = ref.watch(profileFutureProvider);
    return Scaffold(
        backgroundColor: Theme.of(context).indicatorColor,
        appBar: const _ProfileAppBar(),
        body: profileFuture.when(
            data: (_) {
              return Column(
                children: [
                  20.verticalSpace,
                ],
              );
            },
            error: (error, stackTrace) => const NoConnectionWidget(),
            loading: () => const CustomCircular()));
  }
}
