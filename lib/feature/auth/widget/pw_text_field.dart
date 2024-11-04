import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/auth/view_model/password_visibility_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PwTextField extends ConsumerWidget {
  const PwTextField(
      {required this.controller, required this.hintText, super.key});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisibility = ref.watch(pwVisibleProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        style: context.textTheme.labelLarge,
        keyboardType: TextInputType.text,
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: passwordVisibility.togglePwVisibility,
            icon: passwordVisibility.isPasswordObscured
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.blueAccent,
                  )
                : const Icon(
                    Icons.visibility,
                    color: Colors.blueAccent,
                  ),
          ),
          fillColor: context.themeData.scaffoldBackgroundColor,
          filled: true,
          hintText: hintText,
          hintStyle: context.textTheme.labelMedium
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
