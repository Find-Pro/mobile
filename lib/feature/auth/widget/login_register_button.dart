import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({
    required this.text,
    super.key,
    this.borderColor,
    this.onTap,
  });
  final VoidCallback? onTap;
  final String text;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(
          Size(DeviceSize.width(context) / 2.3, 45),
        ),
        maximumSize: WidgetStateProperty.all<Size>(
          Size(DeviceSize.width(context) / 2.3, 45),
        ),
        elevation: WidgetStateProperty.all<double>(0),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.blue.shade800,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          const Icon(
            size: 25,
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
