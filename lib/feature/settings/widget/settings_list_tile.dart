import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {required this.iconData,
      required this.text,
      required this.onTap,
      super.key});
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: context.themeData.cardColor,
      ),
      title: Text(text, style: context.textTheme.headlineSmall),
      onTap: onTap,
    );
  }
}
