import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigateToRouteText extends StatelessWidget {
  const NavigateToRouteText(
      {required this.text1,
      required this.text2,
      required this.route,
      super.key});
  final String text1;
  final String text2;
  final PageRouteInfo route;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: context.textTheme.headlineSmall
              ?.copyWith(color: Colors.black),
        ),
        10.horizontalSpace,
        TextButton(
          onPressed: () {
            context.router.pushAndPopUntil(route, predicate: (_) => false);
          },
          child: Text(
            text2,
            style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
