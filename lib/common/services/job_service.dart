import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/job_operation.dart';
import 'package:findpro/common/services/model/response/job_add_response.dart';
import 'package:findpro/common/services/model/response/job_edit_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/home/model/job_model.dart';
import 'package:vexana/vexana.dart';

class JobService implements JobOperation {
  JobService(INetworkManager<JobModel> networkManager)
      : _networkManager = networkManager;
  final INetworkManager<JobModel> _networkManager;

  @override
  Future<JobAddResponse?> add(JobModel job) async {
    final response =
        await _networkManager.send<JobAddResponse, JobAddResponse>(
      EndPointEnums.jobAdd.fullUrl,
      parseModel: const JobAddResponse(),
      method: RequestType.POST,
      data: job.toJson(),
    );

    return response.data;
  }

  @override
  Future<SuccessAndMessageResponse?> delete(int jobId) async {
    final response = await _networkManager
        .send<SuccessAndMessageResponse, SuccessAndMessageResponse>(
      '${EndPointEnums.jobDelete.fullUrl}$jobId',
      parseModel: const SuccessAndMessageResponse(),
      method: RequestType.DELETE,
    );

    return response.data;
  }

  @override
  Future<JobEditResponse?> edit(int jobId, JobModel updatedJob) async {
    final response =
        await _networkManager.send<JobEditResponse, JobEditResponse>(
      '${EndPointEnums.jobEdit.fullUrl}$jobId',
      parseModel: const JobEditResponse(),
      method: RequestType.POST,
      data: updatedJob.toJson(),
    );

    return response.data;
  }

  @override
  Future<SuccessAndMessageResponse?> complete(int jobId) async {
    final response = await _networkManager
        .send<SuccessAndMessageResponse, SuccessAndMessageResponse>(
      '${EndPointEnums.jobComplete.fullUrl}$jobId',
      parseModel: const SuccessAndMessageResponse(),
      method: RequestType.POST,
    );

    return response.data;
  }
}
