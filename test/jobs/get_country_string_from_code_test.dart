import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetCountryStringFromCode', () {
    late GetCountryStringFromCode getCountryStringFromCode;

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
    });

    setUp(() {
      getCountryStringFromCode = GetCountryStringFromCode();
    });

    testWidgets('should return correct country name for given code', (tester) async {
      await tester.runAsync(() async {
        expect(getCountryStringFromCode.get('zh'), LocaleKeys.china.tr());
        expect(getCountryStringFromCode.get('en'), LocaleKeys.unitedKingdom.tr());
        expect(getCountryStringFromCode.get('fr'), LocaleKeys.france.tr());
        expect(getCountryStringFromCode.get('de'), LocaleKeys.germany.tr());
        expect(getCountryStringFromCode.get('id'), LocaleKeys.india.tr());
        expect(getCountryStringFromCode.get('ja'), LocaleKeys.japan.tr());
        expect(getCountryStringFromCode.get('ko'), LocaleKeys.southKorea.tr());
        expect(getCountryStringFromCode.get('ru'), LocaleKeys.russia.tr());
        expect(getCountryStringFromCode.get('tr'), LocaleKeys.turkey.tr());
        expect(getCountryStringFromCode.get('uk'), LocaleKeys.unitedKingdom.tr());
        expect(getCountryStringFromCode.get('us'), LocaleKeys.unitedStates.tr());
      });
    });

    test('should return empty string for unknown country code', () {
      expect(getCountryStringFromCode.get('xx'), '');
      expect(getCountryStringFromCode.get('random'), '');
    });
  });
}
