import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.iconBg,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
