import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoConnectionWidget extends StatefulWidget {
  const NoConnectionWidget({super.key});

  @override
  NoConnectionWidgetState createState() => NoConnectionWidgetState();
}

class NoConnectionWidgetState extends State<NoConnectionWidget> {
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
        color: Colors.transparent,
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
                    color: const Color.fromARGB(255, 114, 81, 81)
                        .withOpacity(0.6),
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
                        LocaleKeys.connectionError,
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
