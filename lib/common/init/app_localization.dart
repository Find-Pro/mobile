import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/enum/locale_enums.dart';
import 'package:flutter/material.dart';

@immutable
class AppLocalization extends EasyLocalization {
  AppLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];
  static const String _translationPath = 'assets/translations';
  static Future<void> updateLanguage(
    BuildContext context, {
    required Locales value,
  }) async =>
      context.setLocale(value.locale);
}
