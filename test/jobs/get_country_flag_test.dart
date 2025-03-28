import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCountryFlag countryFlag;

  setUp(() {
    countryFlag = GetCountryFlag();
  });

  test('Ülke koduna göre doğru ikon döndürmeli', () {
    expect(countryFlag.getSvgPath('zh'), Assets.iconChina);
    expect(countryFlag.getSvgPath('en'), Assets.iconUk);
    expect(countryFlag.getSvgPath('fr'), Assets.iconFrance);
    expect(countryFlag.getSvgPath('id'), Assets.iconIndia);
    expect(countryFlag.getSvgPath('ja'), Assets.iconJapan);
    expect(countryFlag.getSvgPath('ko'), Assets.iconSouthKorea);
    expect(countryFlag.getSvgPath('ru'), Assets.iconRussia);
    expect(countryFlag.getSvgPath('tr'), Assets.iconTurkey);
    expect(countryFlag.getSvgPath('uk'), Assets.iconUk);
    expect(countryFlag.getSvgPath('de'), Assets.iconGermany);
    expect(countryFlag.getSvgPath('us'), Assets.iconUs);
  });

  test('Geçersiz ülke kodu varsayılan olarak iconLoading döndürmeli', () {
    expect(countryFlag.getSvgPath(''), Assets.iconLoading);
    expect(countryFlag.getSvgPath('xx'), Assets.iconLoading);
    expect(countryFlag.getSvgPath('unknown'), Assets.iconLoading);
    expect(countryFlag.getSvgPath('123'), Assets.iconLoading);
  });
}
