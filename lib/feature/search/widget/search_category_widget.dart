import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/feature/jobs/add_job/helper/categories_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/category_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:findpro/feature/search/view_model/search_input_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCategoryWidget extends ConsumerStatefulWidget {
  const SearchCategoryWidget({required this.pageController, super.key});
  final PageController pageController;
  @override
  ConsumerState<SearchCategoryWidget> createState() =>
      _SearchCategoryWidgetState();
}

class _SearchCategoryWidgetState
    extends ConsumerState<SearchCategoryWidget> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    categories = await CategoriesHelper.instance.parseCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: categories[index].name,
            onTap: () {
              ref.read(searchInputProvider.notifier).categoryId =
                  categories[index].id;
              ref.read(searchInputProvider.notifier).country = CacheManager.instance.getCountry();
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
      },
    );
  }
}
