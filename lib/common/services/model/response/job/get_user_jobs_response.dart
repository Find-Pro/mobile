import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_jobs_response.freezed.dart';
part 'get_user_jobs_response.g.dart';

@freezed
class GetUserJobsResponse with _$GetUserJobsResponse {
  factory GetUserJobsResponse({
    required bool success,
    @Default('') String? message,
    @Default([]) List<JobModel>? result,
  }) = _GetUserJobsResponse;

  factory GetUserJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserJobsResponseFromJson(json);
}
