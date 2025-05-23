import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile.dart';
import 'package:findpro/feature/search/view_model/search_input_view_model.dart';
import 'package:findpro/feature/search/view_model/search_result_view_model.dart';
import 'package:findpro/feature/search/widget/search_result_app_bar.dart';
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

    return Scaffold(
      appBar: const SearchResultAppbar(),
      body: searchResultFuture.when(
        data: (result) {
          if (result != null) {
            Future.microtask(
                () => ref.read(searchResultProvider.notifier).result = result);
          }
          final searchResult = ref.watch(searchResultProvider);
          if (searchResult.result == null) {
            return const NoDataWidget();
          }
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async {
              await context.router.pop();
              //await context.router.pushWidget(const VideoAdView());
              return false;
            },
            child: Stack(
              children: [
                const HomeBackgroundImage(),
                ListView.builder(
                  itemCount: searchResult.result!.length,
                  itemBuilder: (context, index) {
                    return JobListTile(jobModel: searchResult.result![index]);
                  },
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => const NoDataWidget(),
        loading: () => const CustomCircular(),
      ),
    );
  }
}
