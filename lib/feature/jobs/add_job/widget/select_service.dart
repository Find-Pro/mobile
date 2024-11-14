import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/feature/jobs/add_job/helper/categories_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/service_model.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectService extends ConsumerStatefulWidget {
  const SelectService({required this.pageController, super.key});
  final PageController pageController;

  @override
  ConsumerState<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends ConsumerState<SelectService> {
  List<ServiceModel> services = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final categoryId = ref.read(addJobProvider.notifier).categoryId;
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
    final addJobViewModel = ref.read(addJobProvider.notifier);
    if (isLoading) {
      return const CustomCircular();
    }
    if (services.isEmpty) {
      return Center(child: Text('couldNotFindService'.tr()));
    }
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        return AddJobListTile(
            text: services[index].name,
            onTap: () {
              addJobViewModel.serviceId = services[index].id;
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
      },
    );
  }
}
