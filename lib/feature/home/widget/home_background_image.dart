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
            isDarkMode
                ? 'assets/icon/bg_dark.png'
                : 'assets/icon/bg_light.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
