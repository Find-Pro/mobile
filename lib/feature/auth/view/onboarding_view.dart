import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.router.replace(const MainRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.3,
              child: Image.asset(
                'assets/icon/find_pro_high.jpeg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
