import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsAppBar({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        text,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.themeData.scaffoldBackgroundColor,
        ),
      ),
      backgroundColor: context.themeData.primaryColorDark,
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      iconTheme: IconThemeData(
        color: context.themeData.scaffoldBackgroundColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
