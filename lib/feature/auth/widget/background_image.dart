import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        Assets.iconBg,
        fit: BoxFit.cover,
      ),
    );
  }
}
