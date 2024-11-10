import 'package:auto_route/auto_route.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_mixin.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_description.dart';
import 'package:findpro/feature/jobs/add_job/widget/add_job_progress_indicator.dart';
import 'package:findpro/feature/jobs/add_job/widget/change_page_button.dart';
import 'package:findpro/feature/jobs/add_job/widget/select_category.dart';
import 'package:findpro/feature/jobs/add_job/widget/select_city.dart';
import 'package:findpro/feature/jobs/add_job/widget/select_district.dart';
import 'package:findpro/feature/jobs/add_job/widget/select_hourly_wage.dart';
import 'package:findpro/feature/jobs/add_job/widget/select_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddJobView extends ConsumerStatefulWidget {
  const AddJobView({super.key});

  @override
  ConsumerState<AddJobView> createState() => _AddJobViewState();
}

class _AddJobViewState extends ConsumerState<AddJobView> with AddJobMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddJobProgressIndicator(index: currentPageIndex),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() => currentPageIndex = index);
            },
            children: [
              SelectCategory(
                pageController: pageController,
              ),
              SelectService(
                pageController: pageController,
              ),
              SelectCity(
                pageController: pageController,
              ),
              SelectDistrict(
                pageController: pageController,
              ),
              SelectHourlyWage(pageController: pageController),
              const AddDescription(),
            ],
          ),
          if (currentPageIndex != 0)
            ChangePageButton(
              heroTag: 'back',
              icon: Icons.arrow_back,
              left: 16,
              right: null,
              onTap: previousPage,
            ),
        ],
      ),
    );
  }
}
