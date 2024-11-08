import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/job_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/response/job_add_response.dart';
import 'package:findpro/common/services/model/response/job_edit_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/add_job/model/job_add_model.dart';
import 'package:findpro/feature/add_job/model/job_model.dart';

class JobService implements JobOperation {
  @override
  Future<JobAddResponse?> add(JobAddModel job) async {
    final responseData = await NetworkService.instance.baseRequest(
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
  Future<SuccessAndMessageResponse?> delete(int jobId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobDelete,
      data: {'jobId': jobId},
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<JobEditResponse?> edit(int jobId, JobModel updatedJob) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobEdit,
      data: {
        'jobId': jobId,
        'updateData': updatedJob.toJson(),
      },
    );
    return responseData != null
        ? JobEditResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<SuccessAndMessageResponse?> complete(int jobId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.jobComplete,
      data: {'jobId': jobId},
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }
}
