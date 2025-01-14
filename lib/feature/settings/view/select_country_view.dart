// ignore_for_file: invalid_use_of_protected_member,invalid_use_of_visible_for_testing_member
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/feature/home/widget/select_country_app_bar.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/settings/view_model/select_country_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SelectCountryView extends ConsumerWidget {
  const SelectCountryView({required this.isSettingsView, super.key});

  final bool isSettingsView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCountry = ref.watch(selectCountryProvider);
    return Scaffold(
      appBar: isSettingsView
          ? SettingsAppBar(
              text: LocaleKeys.selectCountry.tr(),
            )
          : SelectCountryAppBar(
              text: LocaleKeys.selectCountry.tr(),
            ),
      body: ListView(
        children: [
          _buildListTile(
              context, LocaleKeys.china.tr(), 'cn', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.germany.tr(), 'de', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.france.tr(), 'fr', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.india.tr(), 'in', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.japan.tr(), 'jp', selectedCountry, ref),
          _buildListTile(
              context, LocaleKeys.southKorea.tr(), 'kr', selectedCountry, ref),
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
      floatingActionButton: SettingsConfirmButton(
        text: LocaleKeys.continueE.tr(),
        onTap: () async {
          if (ref.read(selectCountryProvider.notifier).state.isEmpty) {
            InformationToast().show(context, LocaleKeys.error.tr());
            return;
          }
          if (!isSettingsView) {
            CacheManager.instance.setCountry(selectedCountry);
            await context.router
                .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
            return;
          }
          final res = await ref
              .read(selectCountryProvider.notifier)
              .setCountry(selectedCountry);
          if (res) {
            await context.router.pop();
          } else {
            InformationToast().show(context, LocaleKeys.error);
          }
        },
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
        leading: SvgPicture.asset(
          GetCountryFlag().getSvgPath(countryCode),
          height: 45,
        ),
        title: Text(
          country,
          style: context.textTheme.headlineSmall?.copyWith(
            color: isSelected ? context.themeData.indicatorColor : Colors.teal,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing:
            isSelected ? const Icon(Icons.check, color: Colors.green) : null,
        onTap: () async {
          ref.read(selectCountryProvider.notifier).state = countryCode;
        },
      ),
    );
  }
}
