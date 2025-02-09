import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';

class UserSearchNoResultImage extends StatelessWidget {
  const UserSearchNoResultImage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: DeviceSize.width(context),
        height: DeviceSize.height(context) * 0.53,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isDarkMode
                ? Assets.iconSearchBgDark
                : Assets.iconSearchBg),
          ),
        ),
      ),
    );
  }
}
