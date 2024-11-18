import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/home/widget/home_app_bar.dart';
import 'package:findpro/feature/search/view_model/user_search_view_model.dart';
import 'package:findpro/feature/search/widget/user_search_bar.dart';
import 'package:findpro/feature/search/widget/user_search_card.dart';
import 'package:findpro/feature/search/widget/user_search_to_input_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  void initState() {
    super.initState();
    searchCnt = TextEditingController();
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
      appBar: HomeAppBar(text: 'searchUser'.tr()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UserSearchToInputButton(),
            UserSearchBar(textCnt: searchCnt),
            if (userSearchViewModel.result == null ||
                userSearchViewModel.result!.isEmpty)
              SizedBox(
                height: 350,
                child: NoDataFoundWidget(
                  text: 'noUserFound'.tr(),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                itemCount: userSearchViewModel.result!.length,
                itemBuilder: (context, index) {
                  final user = userSearchViewModel.result![index];
                  return UserSearchCard(
                    followerModel: user,
                    currentUserId: 0,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
