import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/job_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/job/get_user_jobs_response.dart';
import 'package:findpro/common/services/model/response/job/job_add_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/jobs/add_job/model/job_add_model.dart';

class JobService implements JobOperation {
  JobService._();

  static final JobService instance = JobService._();

  @override
  Future<JobAddResponse?> add(JobAddModel job) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobAdd,
      data: job.toJson(),
    );
    if (responseData != null && responseData['success'] == true) {
      return JobAddResponse.fromJson(responseData);
    }
    return null;
  }

  @override
  Future<GetUserJobsResponse?> getMultipleJobs(List<int> jobIds) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobGetMultipleJobs,
      data: {'jobIds': jobIds},
    );
    if (responseData != null && responseData['success'] == true) {
      return GetUserJobsResponse.fromJson(responseData);
    }
    return null;
  }

  @override
  Future<SuccessAndMessageResponse?> delete(int jobId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobDelete,
      data: {'jobId': jobId},
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<SuccessAndMessageResponse?> complete(int jobId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobComplete,
      data: {'jobId': jobId},
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<JobAddResponse?> get(int jobId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobGet,
      data: {'jobId': jobId},
    );
    return responseData != null
        ? JobAddResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<GetUserJobsResponse?> getUserJobs(int userId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobGetUserJobs,
      data: {'userId': userId},
    );

    return responseData != null
        ? GetUserJobsResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<GetUserJobsResponse?> homeJobs() async {
    final country = CacheManager.instance.getCountry();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobHomeJobs,
      data: {'country': country},
    );
    return responseData != null
        ? GetUserJobsResponse.fromJson(responseData)
        : null;
  }
}
