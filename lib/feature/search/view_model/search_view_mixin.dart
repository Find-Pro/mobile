import 'package:findpro/feature/search/view/search_view.dart';
import 'package:findpro/feature/search/view_model/search_view_model.dart';
import 'package:flutter/material.dart';

base mixin SearchViewMixin on State<SearchView> {
  late final SearchViewModel _searchViewModel;

  SearchViewModel get searchViewModel => _searchViewModel;

  @override
  void initState() {
    super.initState();
  }
}
