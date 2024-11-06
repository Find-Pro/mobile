import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SettingsConfirmButton extends StatelessWidget {
  const SettingsConfirmButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(190, 50),
            maximumSize: const Size(190, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: context.themeData.primaryColorDark,
            padding: const EdgeInsets.symmetric(vertical: 15),
            side: BorderSide.none,
          ),
          child: Text(text,
              style: context.textTheme.headlineSmall
                  ?.copyWith(color: Colors.white)),
        );
      },
    );
  }
}
