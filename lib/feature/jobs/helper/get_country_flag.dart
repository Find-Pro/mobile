import 'package:findpro/generated/assets.dart';

final class GetCountryFlag {
  String getSvgPath(String country) {
    switch (country) {
      case 'zh':
        return Assets.iconChina;
      case 'en':
        return Assets.iconUk;
      case 'fr':
        return Assets.iconFrance;
      case 'id':
        return Assets.iconIndia;
      case 'ja':
        return Assets.iconJapan;
      case 'ko':
        return Assets.iconSouthKorea;
      case 'ru':
        return Assets.iconRussia;
      case 'tr':
        return Assets.iconTurkey;
      case 'uk':
        return Assets.iconUk;
      case 'de':
        return Assets.iconGermany;
      case 'us':
        return Assets.iconUs;
      default:
        return Assets.iconLoading;
    }
  }
}
