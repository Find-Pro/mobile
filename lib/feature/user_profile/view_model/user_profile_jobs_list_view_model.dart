import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';
import 'package:findpro/common/services/routes/job_service.dart';
import 'package:riverpod/riverpod.dart';

class UserProfileJobsListViewModel
    extends StateNotifier<GetUserJobsResponse> {
  UserProfileJobsListViewModel()
      : super(GetUserJobsResponse(success: false));

  Future<bool> getJobs(int userId) async {
    final response = await JobService.instance.getUserJobs(userId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }
}

final userProfileJobsProvider = StateNotifierProvider<
    UserProfileJobsListViewModel,
    GetUserJobsResponse>((ref) => UserProfileJobsListViewModel());

final userProfileJobsFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, jobId) async {
    final success =
        await ref.read(userProfileJobsProvider.notifier).getJobs(jobId);
    return success;
  },
);
