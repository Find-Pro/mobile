import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';
import 'package:findpro/common/services/routes/job_service.dart';
import 'package:riverpod/riverpod.dart';

class MyJobsViewModel extends StateNotifier<GetUserJobsResponse> {
  MyJobsViewModel() : super(GetUserJobsResponse(success: false));

  Future<bool> getJobs() async {
    final userId = CacheManager.instance.getUserId();
    final response = await JobService.instance.getUserJobs(userId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }

  Future<bool> deleteJob(int jobId) async {
    final response = await JobService.instance.delete(jobId);
    if (response != null) {
      if (response.success) {
        await getJobs();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

final myJobsProvider =
    StateNotifierProvider<MyJobsViewModel, GetUserJobsResponse>(
        (ref) => MyJobsViewModel());

final myJobsFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(myJobsProvider.notifier).getJobs();
    return success;
  },
);
