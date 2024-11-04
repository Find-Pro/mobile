import 'package:findpro/common/const/enum/design_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom responsive for project
class CustomResponsive extends StatelessWidget {
  const CustomResponsive({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DesignSize.designSize.size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, _) => child,
    );
  }
}
