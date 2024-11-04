import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.text,
    super.key,
    this.borderColor,
    this.bgColor,
    this.onTap,
  });
  final VoidCallback? onTap;
  final String text;
  final Color? bgColor;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all<Size>(
            Size(DeviceSize.width(context) - 70, 50),
          ),
          maximumSize: WidgetStateProperty.all<Size>(
            Size(DeviceSize.width(context) - 70, 50),
          ),
          elevation: WidgetStateProperty.all<double>(2),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            bgColor ?? Colors.blueAccent,
          ),
        ),
        child: Text(
          text,
          style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.themeData.scaffoldBackgroundColor),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
