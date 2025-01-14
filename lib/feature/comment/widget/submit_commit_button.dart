import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SubmitCommitButton extends StatelessWidget {
  const SubmitCommitButton({
    required this.onTap,
    required this.text,
    super.key,
  });
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          Size(DeviceSize.width(context) / 2.2, 45),
        ),
        maximumSize: WidgetStateProperty.all<Size>(
          Size(DeviceSize.width(context) / 2.2, 45),
        ),
        elevation: WidgetStateProperty.all<double>(0),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.lightGreenAccent.shade700,
        ),
      ),
      child: Text(
        text,
        style: context.textTheme.headlineSmall
            ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
