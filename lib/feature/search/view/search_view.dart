import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/search/view_model/search_view_mixin.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
    //  required this.onSearch ,
  });
//final String onSearch;
  @override
  State<SearchView> createState() => _SearchViewState();
}

final class _SearchViewState extends State<SearchView>
    with SearchViewMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.themeData.scaffoldBackgroundColor,
      ),
    );
  }
}
