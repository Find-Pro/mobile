import 'package:findpro/common/const/extension/context_extension.dart';
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
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: TextFormField(
        style: context.themeData.textTheme.labelLarge,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onIconButtonPressed,
            icon: Icon(
              iconData,
              color: Colors.blueAccent.shade400,
            ),
          ),
          fillColor: context.themeData.scaffoldBackgroundColor,
          filled: true,
          hintText: hintText,
          hintStyle: context.themeData.textTheme.labelMedium
              ?.copyWith(fontWeight: FontWeight.w500),
          // Add borders
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            borderSide: BorderSide(
              color: context.themeData.primaryColor, // Border color
              width: 1.5, // Border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.themeData.primaryColor
                  .withOpacity(0.5), // Lighter color when enabled
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: context.themeData.primaryColor, // Color when focused
              width: 2, // Thicker border when focused
            ),
          ),
        ),
      ),
    );
  }
}
