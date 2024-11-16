import 'package:findpro/common/services/job_service.dart';
import 'package:findpro/common/services/model/response/get_user_jobs_response.dart';
import 'package:riverpod/riverpod.dart';

class HomeViewModel extends StateNotifier<GetUserJobsResponse> {
  HomeViewModel() : super(GetUserJobsResponse(success: false, result: []));

  Future<bool> getJobs() async {
    final response = await JobService.instance.getFollowingJobs();
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }
}

final homeProvider =
    StateNotifierProvider<HomeViewModel, GetUserJobsResponse>(
        (ref) => HomeViewModel());

final homeFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(homeProvider.notifier).getJobs();
    return success;
  },
);
