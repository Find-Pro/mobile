import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataFoundWidget extends StatefulWidget {
  const NoDataFoundWidget({this.text, super.key});
  final String? text;
  @override
  NoDataFoundWidgetState createState() => NoDataFoundWidgetState();
}

class NoDataFoundWidgetState extends State<NoDataFoundWidget> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
                widget.text ?? 'noDataFound'.tr(),
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
    );
  }
}
