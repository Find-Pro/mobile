import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/feature/jobs/add_job/helper/city_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/district_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:findpro/feature/search/view_model/search_input_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchDistrictWidget extends ConsumerStatefulWidget {
  const SearchDistrictWidget({required this.pageController, super.key});
  final PageController pageController;
  @override
  ConsumerState<SearchDistrictWidget> createState() =>
      _SearchDistrictWidgetState();
}

class _SearchDistrictWidgetState
    extends ConsumerState<SearchDistrictWidget> {
  List<DistrictModel> districts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final cityId = ref.read(searchInputProvider.notifier).cityId;
    if (cityId != null) {
      districts = await CityHelper.instance.getDistrictsByCityId(cityId);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CustomCircular();
    }

    if (districts.isEmpty) {
      return Center(
          child: Text(
        LocaleKeys.couldNotFindDistrict.tr(),
        style: context.textTheme.headlineSmall,
      ));
    }

    return ListView.builder(
      itemCount: districts.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: districts[index].name!,
            onTap: () async {
              ref.read(searchInputProvider.notifier).districtId =
                  districts[index].id;
              await context.router.push(const SearchResultRoute());
            });
      },
    );
  }
}
