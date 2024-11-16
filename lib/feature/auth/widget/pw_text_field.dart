import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/feature/auth/view_model/password_visibility_notifier.dart';
import 'package:findpro/feature/auth/view_model/pw_valid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PwTextField extends ConsumerWidget {
  const PwTextField({
    required this.controller,
    required this.hintText,
    this.isRegisterView = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isRegisterView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordVisibility = ref.watch(pwVisibleProvider);
    final isPasswordValid = ref.watch(passwordValidProvider);
    if (isRegisterView) {
      controller.addListener(() {
        isPasswordValid.value = controller.text.length >= 6;
      });
    }

    return ValueListenableBuilder<bool>(
      valueListenable: isPasswordValid,
      builder: (context, isValid, child) {
        return Padding(
          padding: PaddingInsets().large,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                style: context.textTheme.labelLarge,
                keyboardType: TextInputType.text,
                controller: controller,
                obscureText: passwordVisibility.isPasswordObscured,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_sharp,
                    color: isRegisterView && !isValid
                        ? Colors.red
                        : context.themeData.indicatorColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: passwordVisibility.togglePwVisibility,
                    icon: passwordVisibility.isPasswordObscured
                        ? const Icon(Icons.visibility_off, color: Colors.blue)
                        : const Icon(Icons.visibility, color: Colors.blue),
                  ),
                  fillColor: context.themeData.scaffoldBackgroundColor,
                  filled: true,
                  hintText: hintText,
                  hintStyle: context.textTheme.labelMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: context.themeData.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color:
                      context.themeData.primaryColor.withOpacity(0.5),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: context.themeData.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              if (isRegisterView && !isValid)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'pwMustBeAtLeast'.tr(),
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
