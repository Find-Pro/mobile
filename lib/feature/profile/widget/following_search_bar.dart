import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class FollowingSearchBar extends StatefulWidget {
  const FollowingSearchBar({
    required this.onSearch,
    super.key,
  });
  final void Function(String query) onSearch;

  @override
  FollowingSearchBarState createState() => FollowingSearchBarState();
}

class FollowingSearchBarState extends State<FollowingSearchBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationSearchBar(
      onChanged: (query) {
        if (query.length == 3) {
          widget.onSearch(query);
        }
      },
      searchTextEditingController: _searchController,
      backIcon: Icons.arrow_back,
      backIconColor: context.themeData.indicatorColor,
      isBackButtonVisible: false,
      centerTitle: ' ',
      centerTitleStyle: const TextStyle(color: Colors.transparent),
      hintStyle: const TextStyle(color: Colors.transparent),
      textStyle: context.themeData.textTheme.headlineSmall,
      cursorColor: Colors.lightBlue.shade300,
      duration: const Duration(milliseconds: 500),
      searchFieldHeight: 40,
      searchBarHeight: 60,
      searchBarWidth: MediaQuery.of(context).size.width - 35,
      horizontalPadding: 0,
      verticalPadding: 0,
      searchIconColor: context.themeData.indicatorColor,
      closeIconColor: Colors.redAccent,
      searchFieldDecoration: BoxDecoration(
        color: context.themeData.splashColor,
        border: Border.all(color: Colors.blue, width: .5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
