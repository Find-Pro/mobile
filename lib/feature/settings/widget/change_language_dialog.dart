import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/enum/locale_enums.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/init/app_localization.dart';
import 'package:findpro/generated/assets.dart';
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
                LanguageTile(
                  context: context,
                  locale: Locales.zh,
                  iconPath: Assets.iconChina,
                  title: LocaleKeys.chinaLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.de,
                  iconPath: Assets.iconGermany,
                  title: LocaleKeys.deutschLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.fr,
                  iconPath: Assets.iconFrance,
                  title: LocaleKeys.frenchLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.id,
                  iconPath: Assets.iconIndia,
                  title: LocaleKeys.indianLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.ja,
                  iconPath: Assets.iconJapan,
                  title: LocaleKeys.japaneseLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.ko,
                  iconPath: Assets.iconSouthKorea,
                  title: LocaleKeys.southKoreanLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.ru,
                  iconPath: Assets.iconRussia,
                  title: LocaleKeys.russianLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.tr,
                  iconPath: Assets.iconTurkey,
                  title: LocaleKeys.turkishLang.tr(),
                ),
                LanguageTile(
                  context: context,
                  locale: Locales.en,
                  iconPath: Assets.iconUs,
                  title: LocaleKeys.englishLang.tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    required this.context,
    required this.locale,
    required this.iconPath,
    required this.title,
    super.key,
  });
  final BuildContext context;
  final Locales locale;
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.themeData.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: SvgPicture.asset(
        iconPath,
        height: 30,
      ),
      title: Text(
        title,
        style: context.textTheme.labelLarge,
      ),
      onTap: () async {
        await AppLocalization.updateLanguage(
          this.context,
          value: locale,
        ).then((value) {
          this.context.router.pop();
        });
      },
    );
  }
}
