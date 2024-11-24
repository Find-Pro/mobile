import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';
import 'package:findpro/common/services/routes/search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultViewModel extends StateNotifier<GetUserJobsResponse> {
  SearchResultViewModel() : super(GetUserJobsResponse(success: false));

  Future<GetUserJobsResponse?> performSearch(
      SearchRequest searchRequest) async {
    final response = await SearchService.instance.searchJob(searchRequest);
    return response;
  }

  GetUserJobsResponse get result => state;
  set result(GetUserJobsResponse response) {
    state = response;
  }
}

final searchResultProvider =
    StateNotifierProvider<SearchResultViewModel, GetUserJobsResponse>(
  (ref) => SearchResultViewModel(),
);

final searchResultFutureProvider =
    FutureProvider.autoDispose.family<GetUserJobsResponse?, SearchRequest>(
  (ref, searchRequest) async {
    return ref
        .read(searchResultProvider.notifier)
        .performSearch(searchRequest);
  },
);
