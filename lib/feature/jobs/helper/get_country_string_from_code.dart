import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/generated/locale_keys.g.dart';

final class GetCountryStringFromCode {
  String get(String country) {
    switch (country) {
      case 'cn':
        return LocaleKeys.china.tr();
      case 'en':
        return LocaleKeys.unitedKingdom.tr();
      case 'fr':
        return LocaleKeys.france.tr();
      case 'in':
        return LocaleKeys.india.tr();
      case 'jp':
        return LocaleKeys.japan.tr();
      case 'kr':
        return LocaleKeys.southKorea.tr();
      case 'ru':
        return LocaleKeys.russia.tr();
      case 'tr':
        return LocaleKeys.turkey.tr();
      case 'uk':
        return LocaleKeys.unitedKingdom.tr();
      case 'us':
        return LocaleKeys.unitedStates.tr();
      default:
        return LocaleKeys.turkey.tr();
    }
  }
}
