import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AlertDialogListTile extends StatelessWidget {
  const AlertDialogListTile({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.themeData.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(icon, color: context.themeData.primaryColor),
      title: Text(
        text,
        style: context.textTheme.labelLarge,
      ),
      onTap: onTap,
    );
  }
}
