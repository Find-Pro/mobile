import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Column(
        children: [
          100.verticalSpace,
          TextButton(
              onPressed: () async {
                final res = await UserService().profile();
              },
              child: const Text('HOME')),
          20.verticalSpace,
          TextButton(
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              child: Text(
                LocaleKeys.register,
                style: context.textTheme.headlineMedium,
              )),
        ],
      ),
    );
  }
}
