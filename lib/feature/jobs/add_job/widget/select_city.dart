import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/jobs/add_job/helper/add_job_city_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCity extends ConsumerStatefulWidget {
  const SelectCity({required this.pageController, super.key});
  final PageController pageController;

  @override
  ConsumerState<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends ConsumerState<SelectCity> {
  List<CityModel> cities = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    cities = await AddJobCityHelper.instance.getAllCities();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final addJobViewModel = ref.read(addJobProvider.notifier);
    return Column(
      children: [
        10.verticalSpace,
        Text(
          'LocaleKeys.pleaseSelectACategory.tr()',
          style: context.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return AddJobListTile(
                  text: cities[index].name,
                  onTap: () {
                    addJobViewModel.cityId = cities[index].ilId;
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
