import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';
import 'package:findpro/common/services/model/response/job_add_response.dart';
import 'package:findpro/common/services/model/response/job_edit_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/jobs/add_job/model/job_add_model.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';

abstract class JobOperation {
  Future<JobAddResponse?> add(JobAddModel job);
  Future<SuccessAndMessageResponse?> delete(int userId);
  Future<JobEditResponse?> edit(int jobId, JobModel updatedJob);
  Future<SuccessAndMessageResponse?> complete(int jobId);
  Future<JobAddResponse?> get(int jobId);
  Future<GetUserJobsResponse?> getUserJobs(int userId);
  Future<GetUserJobsResponse?> homeJobs();
}
