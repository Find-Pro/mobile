import 'dart:io';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';

class AppleGoogleRow extends StatelessWidget {
  const AppleGoogleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (Platform.isAndroid)
          Image.asset(
            Assets.iconGooglelogo,
            height: 50,
          ),
        if (Platform.isIOS)
          Image.asset(
            Assets.iconApplelogo,
            height: 50,
          )
      ],
      //Platform.isIOS
    );
  }
}
