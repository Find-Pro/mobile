import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:flutter/material.dart';

class AddJobListTile extends StatelessWidget {
  const AddJobListTile(
      {required this.text, required this.onTap, super.key});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().medium,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        style: ListTileStyle.list,
        subtitle: Text(
          text,
          style: context.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.teal.shade600,
        ),
        onTap: onTap,
      ),
    );
  }
}
