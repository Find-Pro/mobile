import 'package:findpro/common/services/model/response/job_add_response.dart';
import 'package:findpro/common/services/model/response/job_edit_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/home/model/job_model.dart';

abstract class JobOperation {
  Future<JobAddResponse?> add(JobModel job);
  Future<SuccessAndMessageResponse?> delete(int userId);
  Future<JobEditResponse?> edit(int jobId, JobModel updatedJob);
  Future<SuccessAndMessageResponse?> complete(int jobId);
}
