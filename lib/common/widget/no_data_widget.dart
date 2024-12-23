import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({this.text, super.key});
  final String? text;
  @override
  NoDataWidgetState createState() => NoDataWidgetState();
}

class NoDataWidgetState extends State<NoDataWidget> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeBackgroundImage(),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 400),
            child: GestureDetector(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text ?? LocaleKeys.noDataFound.tr(),
                      style: context.textTheme.headlineSmall,
                    ),
                    Lottie.asset(
                      Assets.lottieEmptyFollower,
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
