import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/search_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:findpro/common/services/model/response/follow_list_response.dart';
import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';

class SearchService implements SearchOperation {
  SearchService._();
  static final SearchService instance = SearchService._();
  @override
  Future<GetUserJobsResponse?> searchJob(
      SearchRequest searchRequest) async {
    final response = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.searchJob,
      data: {
        'jobCategoryId': searchRequest.jobCategoryId,
        'jobServiceId': searchRequest.jobServiceId,
        'cityId': searchRequest.cityId,
        'districtId': searchRequest.districtId,
      },
    );

    return GetUserJobsResponse.fromJson(response!);
  }

  @override
  Future<FollowListResponse?> searchUser(String query) async {
    final response = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.searchUser,
      data: {'query': query},
    );

    return FollowListResponse.fromJson(response!);
  }
}
