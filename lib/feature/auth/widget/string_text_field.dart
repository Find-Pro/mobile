import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:flutter/material.dart';

class StringTextField extends StatelessWidget {
  const StringTextField({
    required this.controller,
    required this.hintText,
    required this.iconData,
    super.key,
    this.onIconButtonPressed,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onIconButtonPressed;
  final IconData iconData;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().large,
      child: TextFormField(
        style: context.themeData.textTheme.labelLarge,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onIconButtonPressed,
            icon: Icon(
              iconData,
              color: context.themeData.indicatorColor,
            ),
          ),
          fillColor: context.themeData.scaffoldBackgroundColor,
          filled: true,
          hintText: hintText,
          hintStyle: context.themeData.textTheme.labelMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          // Add borders
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.themeData.primaryColor,
              width: 1.5, // Border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.themeData.primaryColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.themeData.primaryColor,
              width: 2, // Thicker border when focused
            ),
          ),
        ),
      ),
    );
  }
}
