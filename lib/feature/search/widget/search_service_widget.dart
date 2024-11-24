import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/feature/jobs/add_job/helper/categories_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/service_model.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:findpro/feature/search/view_model/search_input_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchServiceWidget extends ConsumerStatefulWidget {
  const SearchServiceWidget({required this.pageController, super.key});
  final PageController pageController;
  @override
  ConsumerState<SearchServiceWidget> createState() =>
      _SearchServiceState();
}

class _SearchServiceState extends ConsumerState<SearchServiceWidget> {
  List<ServiceModel> services = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final categoryId = ref.read(searchInputProvider.notifier).categoryId;
    if (categoryId != null) {
      services = await CategoriesHelper.instance
          .getServicesByCategoryId(categoryId);
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
    if (services.isEmpty) {
      return Center(
          child: Text(
        LocaleKeys.couldNotFindService.tr(),
        style: context.textTheme.headlineSmall,
      ));
    }
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: services[index].name,
            onTap: () {
              ref.read(addJobProvider.notifier).serviceId =
                  services[index].id;
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
      },
    );
  }
}
