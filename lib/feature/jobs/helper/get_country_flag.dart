import 'package:findpro/generated/assets.dart';

final class GetCountryFlag {
  String getSvgPath(String country) {
    switch (country) {
      case 'cn':
        return Assets.iconChina;
      case 'en':
        return Assets.iconUk;
      case 'fr':
        return Assets.iconFrance;
      case 'in':
        return Assets.iconIndia;
      case 'jp':
        return Assets.iconJapan;
      case 'kr':
        return Assets.iconSouthKorea;
      case 'ru':
        return Assets.iconRussia;
      case 'tr':
        return Assets.iconTurkey;
      case 'uk':
        return Assets.iconUk;
      case 'us':
        return Assets.iconUs;
      default:
        return Assets.iconTurkey;
    }
  }
}
