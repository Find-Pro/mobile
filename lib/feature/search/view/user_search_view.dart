import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/feature/home/widget/home_country_app_bar.dart';
import 'package:findpro/feature/search/view_model/user_search_view_model.dart';
import 'package:findpro/feature/search/widget/user_search_bar.dart';
import 'package:findpro/feature/search/widget/user_search_card.dart';
import 'package:findpro/feature/search/widget/user_search_no_result_image.dart';
import 'package:findpro/feature/search/widget/user_search_to_input_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class UserSearchView extends ConsumerStatefulWidget {
  const UserSearchView({
    super.key,
  });

  @override
  ConsumerState<UserSearchView> createState() => _UserSearchViewState();
}

class _UserSearchViewState extends ConsumerState<UserSearchView> {
  late final TextEditingController searchCnt;
  int currentUserId = 0;

  @override
  void initState() {
    super.initState();
    searchCnt = TextEditingController();
    currentUserId = CacheManager.instance.getUserId();
  }

  @override
  void dispose() {
    searchCnt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userSearchViewModel = ref.watch(userSearchProvider);
    return Scaffold(
      appBar: const HomeCountryAppBar(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.verticalSpace,
            const UserSearchToInputButton(),
            if (CacheManager.instance.getUserId() != 0)
              UserSearchBar(textCnt: searchCnt),
            if (userSearchViewModel.result == null ||
                userSearchViewModel.result!.isEmpty)
              const UserSearchNoResultImage()
            else
              ListView.builder(
                shrinkWrap: true,
                itemCount: userSearchViewModel.result!.length,
                itemBuilder: (context, index) {
                  final user = userSearchViewModel.result![index];
                  return UserSearchCard(
                    followerModel: user,
                    currentUserId: currentUserId,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
