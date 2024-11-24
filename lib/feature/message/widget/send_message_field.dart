import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SendMessageField extends StatelessWidget {
  const SendMessageField(
      {required this.controller, required this.onTap, super.key});
  final TextEditingController controller;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().medium,
      child: Row(children: [
        Expanded(
          child: TextField(
            style: context.textTheme.labelLarge,
            decoration: InputDecoration(
              hintStyle: context.textTheme.labelLarge,
              hintText: LocaleKeys.typeAMessage.tr(),
              border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
            ),
            controller: controller,
            textInputAction: TextInputAction.send,
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.send,
            color: context.themeData.indicatorColor,
          ),
          onPressed: onTap,
        )
      ]),
    );
  }
}
