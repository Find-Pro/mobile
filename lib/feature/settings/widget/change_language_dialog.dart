import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/enum/locale_enums.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/init/app_localization.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeLanguageDialog {
  void show(BuildContext context) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.transparent,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  tileColor: context.themeData.scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  leading: SvgPicture.asset(
                    'assets/icon/turkey.svg',
                    height: 30,
                  ),
                  title: Text(
                    LocaleKeys.turkish.tr(),
                    style: context.textTheme.labelLarge,
                  ),
                  onTap: () async {
                    await AppLocalization.updateLanguage(
                      context,
                      value: Locales.tr,
                    ).then((value) {
                      context.router.pop();
                    });
                  },
                ),
                ListTile(
                  tileColor: context.themeData.scaffoldBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                  leading: SvgPicture.asset(
                    'assets/icon/us.svg',
                    height: 30,
                  ),
                  title: Text(
                    LocaleKeys.english.tr(),
                    style: context.textTheme.labelLarge,
                  ),
                  onTap: () async {
                    await AppLocalization.updateLanguage(
                      context,
                      value: Locales.en,
                    ).then((value) {
                      context.router.pop();
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
