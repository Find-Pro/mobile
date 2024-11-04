import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class NavBarItem {
  const NavBarItem({
    required this.image,
    required this.text,
    required this.isActive,
    required this.isSettings,
  });
  final String image;
  final String text;
  final bool isActive;
  final bool isSettings;

  BottomNavigationBarItem build(BuildContext context) {
    return BottomNavigationBarItem(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      icon: Image.asset(
        image,
        width: 25,
        height: 25,
        color: isSettings
            ? Colors.green
            : (isActive ? Colors.cyan : context.themeData.indicatorColor),
      ),
      label: text,
      tooltip: isSettings ? 'Settings' : text,
    );
  }
}
