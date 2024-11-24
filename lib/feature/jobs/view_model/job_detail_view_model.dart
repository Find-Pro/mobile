import 'package:findpro/common/services/model/response/job_add_response.dart';
import 'package:findpro/common/services/routes/job_service.dart';
import 'package:riverpod/riverpod.dart';

class JobDetailViewModel extends StateNotifier<JobAddResponse> {
  JobDetailViewModel() : super(const JobAddResponse(success: false));

  Future<bool> getJob(int jobId) async {
    final response = await JobService.instance.get(jobId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }
}

final jobDetailProvider =
    StateNotifierProvider<JobDetailViewModel, JobAddResponse>(
        (ref) => JobDetailViewModel());

final jobDetailFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, jobId) async {
    final success =
        await ref.read(jobDetailProvider.notifier).getJob(jobId);
    return success;
  },
);
