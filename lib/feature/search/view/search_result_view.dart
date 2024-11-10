import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile.dart';
import 'package:findpro/feature/search/view_model/search_input_view_model.dart';
import 'package:findpro/feature/search/view_model/search_result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SearchResultView extends ConsumerWidget {
  const SearchResultView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRequest = ref.watch(searchInputProvider);
    final searchResultFuture =
        ref.watch(searchResultFutureProvider(searchRequest));
    return searchResultFuture.when(
      data: (result) {
        if (result != null) {
          Future.microtask(() =>
              ref.read(searchResultProvider.notifier).result = result);
        }
        final searchResult = ref.watch(searchResultProvider);
        if (searchResult.result == null) {
          return const NoDataFoundWidget();
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.router.pushAndPopUntil(
                    const MainRoute(),
                    predicate: (_) => false),
                icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  color: context.themeData.indicatorColor,
                )),
          ),
          body: ListView.builder(
            itemCount: searchResult.result!.length,
            itemBuilder: (context, index) {
              return JobListTile(jobModel: searchResult.result![index]);
            },
          ),
        );
      },
      error: (error, stackTrace) => const NoDataFoundWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
