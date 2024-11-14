import 'package:findpro/generated/assets.dart';

class GetCategoryIcon {
  String get(int categoryId) {
    switch (categoryId) {
      case 1:
        return Assets.icon1;
      case 2:
        return Assets.icon2;
      case 3:
        return Assets.icon3;
      case 4:
        return Assets.icon4;
      case 5:
        return Assets.icon5;
      case 6:
        return Assets.icon6;
      case 7:
        return Assets.icon7;
      case 8:
        return Assets.icon8;
      case 9:
        return Assets.icon9;
      case 10:
        return Assets.icon10;
      case 11:
        return Assets.icon11;
      case 12:
        return Assets.icon12;
      default:
        return Assets.icon1;
    }
  }
}
