import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/search_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:findpro/common/services/model/response/follow/follow_list_response.dart';
import 'package:findpro/common/services/model/response/job/get_user_jobs_response.dart';

class SearchService implements SearchOperation {
  SearchService._();

  static final SearchService instance = SearchService._();

  @override
  Future<GetUserJobsResponse?> searchJob(
      SearchRequest searchRequest) async {
    final currentCountry = CacheManager.instance.getCountry();
    final response = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.searchJob,
      data: {
        'jobCategoryId': searchRequest.jobCategoryId,
        'jobServiceId': searchRequest.jobServiceId,
        'cityId': searchRequest.cityId,
        'districtId': searchRequest.districtId,
        'country': currentCountry,
      },
    );

    return GetUserJobsResponse.fromJson(response!);
  }

  @override
  Future<FollowListResponse?> searchUser(String query) async {
    final response = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.searchUser,
      data: {'query': query},
    );

    return FollowListResponse.fromJson(response!);
  }
}
