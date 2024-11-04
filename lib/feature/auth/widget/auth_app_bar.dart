import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        text,
        style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.themeData.scaffoldBackgroundColor),
      ),
      backgroundColor: context.themeData.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
