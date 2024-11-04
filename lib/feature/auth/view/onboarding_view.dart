import 'package:auto_route/auto_route.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.7,
              child: Lottie.asset(
                Assets.lottieEmptyHome,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
