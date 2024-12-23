import 'package:findpro/feature/jobs/add_job/helper/add_job_city_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:findpro/feature/search/view_model/search_input_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCityWidget extends ConsumerStatefulWidget {
  const SearchCityWidget({required this.pageController, super.key});
  final PageController pageController;
  @override
  ConsumerState<SearchCityWidget> createState() =>
      _SearchCityWidgetState();
}

class _SearchCityWidgetState extends ConsumerState<SearchCityWidget> {
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
    final searchInputViewModel = ref.read(searchInputProvider.notifier);
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: cities[index].name,
            onTap: () {
              searchInputViewModel.cityId = cities[index].ilId;
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
      },
    );
  }
}
