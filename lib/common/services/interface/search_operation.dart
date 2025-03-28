import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:findpro/common/services/model/response/follow/follow_list_response.dart';
import 'package:findpro/common/services/model/response/job/get_user_jobs_response.dart';

abstract class SearchOperation {
  Future<FollowListResponse?> searchUser(String query);

  Future<GetUserJobsResponse?> searchJob(SearchRequest searchRequest);
}
