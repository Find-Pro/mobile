// ignore_for_file: one_member_abstracts

import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';

abstract class SearchOperation {
  Future<GetUserJobsResponse?> search(SearchRequest searchRequest);
}
