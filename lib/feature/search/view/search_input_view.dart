import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/feature/home/widget/home_app_bar.dart';
import 'package:findpro/feature/jobs/add_job/widget/change_page_button.dart';
import 'package:findpro/feature/search/view/search_mixin.dart';
import 'package:findpro/feature/search/widget/search_category_widget.dart';
import 'package:findpro/feature/search/widget/search_city_widget.dart';
import 'package:findpro/feature/search/widget/search_district_widget.dart';
import 'package:findpro/feature/search/widget/search_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SearchInputView extends ConsumerStatefulWidget {
  const SearchInputView({super.key});

  @override
  ConsumerState<SearchInputView> createState() => _SearchInputViewState();
}

class _SearchInputViewState extends ConsumerState<SearchInputView>
    with SearchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(text: 'searchService'.tr()),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: [
              SearchCategoryWidget(
                pageController: pageController,
              ),
              SearchServiceWidget(
                pageController: pageController,
              ),
              SearchCityWidget(
                pageController: pageController,
              ),
              SearchDistrictWidget(
                pageController: pageController,
              ),
            ],
          ),
          if (currentIndex != 0)
            ChangePageButton(
              heroTag: 'search back',
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
