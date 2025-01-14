import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SelectCountryAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SelectCountryAppBar({required this.text, super.key});

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
      backgroundColor: Colors.grey.shade700,
      elevation: 4,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 10);
}
