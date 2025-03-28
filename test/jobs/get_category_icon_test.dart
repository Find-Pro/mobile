import 'package:findpro/feature/jobs/helper/get_category_icon.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCategoryIcon categoryIcon;

  setUp(() {
    categoryIcon = GetCategoryIcon();
  });

  test("Kategori ID'ye göre doğru ikon döndürmeli", () {
    expect(categoryIcon.get(1), Assets.icon1);
    expect(categoryIcon.get(2), Assets.icon2);
    expect(categoryIcon.get(3), Assets.icon3);
    expect(categoryIcon.get(4), Assets.icon4);
    expect(categoryIcon.get(5), Assets.icon5);
    expect(categoryIcon.get(6), Assets.icon6);
    expect(categoryIcon.get(7), Assets.icon7);
    expect(categoryIcon.get(8), Assets.icon8);
    expect(categoryIcon.get(9), Assets.icon9);
    expect(categoryIcon.get(10), Assets.icon10);
    expect(categoryIcon.get(11), Assets.icon11);
    expect(categoryIcon.get(12), Assets.icon12);
  });

  test("Geçersiz kategori ID'si varsayılan olarak icon1 döndürmeli", () {
    expect(categoryIcon.get(0), Assets.icon1);
    expect(categoryIcon.get(99), Assets.icon1);
    expect(categoryIcon.get(-5), Assets.icon1);
  });
}
