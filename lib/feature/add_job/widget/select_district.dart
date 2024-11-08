import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/feature/add_job/helper/city_helper.dart';
import 'package:findpro/feature/add_job/model/district_model.dart';
import 'package:findpro/feature/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/add_job/widget/add_job_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectDistrict extends ConsumerStatefulWidget {
  const SelectDistrict({required this.pageController, super.key});
  final PageController pageController;

  @override
  ConsumerState<SelectDistrict> createState() => _SelectDistrictState();
}

class _SelectDistrictState extends ConsumerState<SelectDistrict> {
  List<DistrictModel> districts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final cityId = ref.read(addJobProvider.notifier).cityId;
    if (cityId != null) {
      districts = await CityHelper.instance.getDistrictsByCityId(cityId);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final addJobViewModel = ref.read(addJobProvider.notifier);

    if (isLoading) {
      return const CustomCircular();
    }

    if (districts.isEmpty) {
      return const Center(child: Text(LocaleKeys.couldNotFindDistrict));
    }

    return ListView.builder(
      itemCount: districts.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: districts[index].name!,
            onTap: () {
              addJobViewModel.districtId = districts[index].id;
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
      },
    );
  }
}
