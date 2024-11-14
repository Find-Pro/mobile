import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {required this.iconData,
      required this.text,
      required this.onTap,
      this.iconColor,
      super.key});
  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: iconColor ?? context.themeData.cardColor,
      ),
      title: Text(text,
          style: context.textTheme.labelLarge
              ?.copyWith(fontWeight: FontWeight.w700)),
      onTap: onTap,
    );
  }
}
