import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/feature/settings/view_model/select_country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileCurrentCountryContainer extends ConsumerWidget {
  const EditProfileCurrentCountryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCountry = ref.watch(selectCountryProvider);
    return Padding(
      padding: PaddingInsets().medium,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        style: ListTileStyle.list,
        leading: SizedBox(
          height: 60,
          child: SvgPicture.asset(
            GetCountryFlag().getSvgPath(currentCountry),
            height: 50,
          ),
        ),
        title: Text(
          GetCountryStringFromCode().get(currentCountry),
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
            onPressed: () async {
              await context.router
                  .push(SelectCountryRoute(isSettingsView: true));
            },
            icon: Icon(
              Icons.edit_outlined,
              color: context.themeData.indicatorColor,
            )),
      ),
    );
  }
}
