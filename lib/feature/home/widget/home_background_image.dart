import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeBackgroundImage extends StatelessWidget {
  const HomeBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              isDarkMode ? Assets.iconBgDark : Assets.iconBgLight),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
