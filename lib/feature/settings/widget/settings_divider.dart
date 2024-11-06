import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        Divider(
          height: 0.7,
          thickness: 0.6,
          color: context.themeData.indicatorColor,
        ),
      ],
    );
  }
}
