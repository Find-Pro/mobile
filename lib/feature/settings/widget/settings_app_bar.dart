import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/platform_extension.dart';
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
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: Icon(
          context.platform == PlatformExtension.iOS
              ? Icons.arrow_back_ios
              : Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade400,
              Colors.teal.shade600,
              Colors.teal.shade400
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
