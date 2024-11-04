import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.7,
      thickness: 0.6,
      color: context.themeData.indicatorColor,
    );
  }
}
