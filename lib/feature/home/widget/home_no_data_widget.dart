import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeNoDataWidget extends StatefulWidget {
  const HomeNoDataWidget({this.text, super.key});
  final String? text;
  @override
  HomeNoDataWidgetState createState() => HomeNoDataWidgetState();
}

class HomeNoDataWidgetState extends State<HomeNoDataWidget> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAnimated = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            isAnimated = false;
          });
        });
      },
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
        padding: isAnimated
            ? const EdgeInsets.only(bottom: 80)
            : const EdgeInsets.only(bottom: 30),
        child: Align(
          child: Container(
            decoration: BoxDecoration(
              color: context.themeData.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: PaddingInsets().xxl,
                  child: Text(
                    LocaleKeys.homeViewText.tr(),
                    style: context.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                )),
                Expanded(
                    flex: 2,
                    child: Lottie.asset(
                      Assets.lottieEmptyFollower,
                      width: 150,
                      height: 150,
                    )),
                Expanded(
                    child: Text(
                  widget.text ?? LocaleKeys.noDataFound.tr(),
                  style: context.textTheme.headlineSmall,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
