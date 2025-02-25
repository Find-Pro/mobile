import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsConfirmButton extends ConsumerWidget {
  const SettingsConfirmButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(155, 50),
            maximumSize: const Size(180, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 15),
            side: BorderSide.none,
          ),
          child: Text(text,
              style: context.textTheme.labelLarge
                  ?.copyWith(color: Colors.white)),
        );
      },
    );
  }
}
