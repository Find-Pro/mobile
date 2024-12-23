import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/settings/view_model/edit_profile_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

final selectedCountryProvider = StateProvider<String>((ref) {
  return ref.watch(editProfileProvider).user?.country ?? 'tr';
});

//
class SelectCountryList extends ConsumerWidget {
  const SelectCountryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref.watch(selectedCountryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.selectCountry.tr()),
      ),
      body: ListView(
        children: [
          _buildListTile(
              context, LocaleKeys.china.tr(), 'cn', selectedCountry, ref),
          _buildListTile(context, LocaleKeys.germany.tr(), 'de',
              selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.france.tr(), 'fr', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.india.tr(), 'in', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.japan.tr(), 'jp', selectedCountry, ref),
          _buildListTile(context, LocaleKeys.southKorea.tr(), 'kr',
              selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.russia.tr(), 'ru', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.turkey.tr(), 'tr', selectedCountry, ref),
          _buildListTile(context, LocaleKeys.unitedKingdom.tr(), 'uk',
              selectedCountry, ref),
          _buildListTile(context, LocaleKeys.unitedStates.tr(), 'us',
              selectedCountry, ref),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print('Selected Country: $selectedCountry');
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        child: Text(LocaleKeys.continueE.tr()),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String country,
      String countryCode, String selectedCountry, WidgetRef ref) {
    final isSelected = selectedCountry == countryCode;

    return Padding(
      padding: PaddingInsets().xl,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        style: ListTileStyle.list,
        leading:
            SvgPicture.asset(GetCountryFlag().getSvgPath(countryCode)),
        title: Text(
          country,
          style: context.textTheme.headlineSmall?.copyWith(
            color: isSelected ? Colors.blue : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.check, color: Colors.green)
            : null,
        onTap: () {
          ref.read(selectedCountryProvider.notifier).state = countryCode;
        },
      ),
    );
  }
}
