import 'package:findpro/feature/add_job/helper/categories_helper.dart';
import 'package:findpro/feature/add_job/model/category_model.dart';
import 'package:findpro/feature/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/add_job/widget/add_job_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectCategory extends ConsumerStatefulWidget {
  const SelectCategory({required this.pageController, super.key});
  final PageController pageController;

  @override
  ConsumerState<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends ConsumerState<SelectCategory> {
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
    final addJobViewModel = ref.read(addJobProvider.notifier);
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: categories[index].name,
            onTap: () {
              addJobViewModel.categoryId = categories[index].id;
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
      },
    );
  }
}
