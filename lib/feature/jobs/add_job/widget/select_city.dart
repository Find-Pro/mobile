import 'package:findpro/feature/jobs/add_job/helper/city_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    cities = await CityHelper.instance.getAllCities();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final addJobViewModel = ref.read(addJobProvider.notifier);
    return ListView.builder(
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
    );
  }
}
