import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataFoundWidget extends StatefulWidget {
  const NoDataFoundWidget({super.key});

  @override
  NoDataFoundWidgetState createState() => NoDataFoundWidgetState();
}

class NoDataFoundWidgetState extends State<NoDataFoundWidget> {
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
      child: ColoredBox(
        color: context.themeData.scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedPadding(
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
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        Assets.lottieEmptyFollower,
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 1),
                      Text(
                        'noDataFound'.tr(),
                        style: context.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
