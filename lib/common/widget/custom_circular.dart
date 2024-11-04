import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomCircular extends StatelessWidget {
  const CustomCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(Assets.lottieCircular, height: 50));
  }
}
