import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class AddCommentTextField extends StatefulWidget {
  const AddCommentTextField({required this.textController, super.key});
  final TextEditingController textController;

  @override
  State<AddCommentTextField> createState() => _AddCommentTextFieldState();
}

class _AddCommentTextFieldState extends State<AddCommentTextField> {
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    widget.textController.addListener(_checkTextLength);
  }

  void _checkTextLength() {
    setState(() {
      if (widget.textController.text.length < 10) {
        errorMessage = LocaleKeys.commentShouldBe10Character.tr();
      } else {
        errorMessage = '';
      }
    });
  }

  @override
  void dispose() {
    widget.textController.removeListener(_checkTextLength);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Padding(
            padding: PaddingInsets().large,
            child: TextField(
              controller: widget.textController,
              decoration: InputDecoration(
                hintText: LocaleKeys.addCommentText.tr(),
                labelStyle: context.themeData.textTheme.labelLarge,
                hintStyle: context.textTheme.labelLarge,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: context.themeData.indicatorColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: context.textTheme.labelLarge,
            ),
          ),
          if (errorMessage.isNotEmpty)
            Text(
              LocaleKeys.commentShouldBe10Character.tr(),
              style: context.textTheme.labelLarge
                  ?.copyWith(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
