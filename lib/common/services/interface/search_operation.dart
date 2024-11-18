import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:findpro/common/services/model/response/follow_list_response.dart';
import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';

abstract class SearchOperation {
  Future<FollowListResponse?> searchUser(String query);
  Future<GetUserJobsResponse?> searchJob(SearchRequest searchRequest);
}
