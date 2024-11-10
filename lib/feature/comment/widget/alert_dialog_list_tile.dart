import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AlertDialogListTile extends StatelessWidget {
  const AlertDialogListTile({
    required this.iconData,
    required this.text,
    required this.onTap,
    super.key,
  });
  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.themeData.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(
        iconData,
        color: context.themeData.indicatorColor,
        size: 24,
      ),
      title: Text(
        text,
        style: context.textTheme.labelMedium,
      ),
      onTap: onTap,
    );
  }
}
