import 'package:findpro/common/services/model/response/job_add_response.dart';
import 'package:findpro/common/services/routes/job_service.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
import 'package:riverpod/riverpod.dart';

class JobDetailViewModel extends StateNotifier<JobAddResponse> {
  JobDetailViewModel() : super(const JobAddResponse(success: false));

  List<String> categoryAndServiceName = [];
  List<String> cityAndDistrictName = [];

  Future<bool> getJob(int jobId) async {
    final response = await JobService.instance.get(jobId);
    if (response != null) {
      categoryAndServiceName = await JobDetailHelper.instance
          .getCategoryAndServiceName(response.result!.jobCategoryId!,
              response.result!.jobServiceId!);
      cityAndDistrictName = await JobDetailHelper.instance
          .getCityAndDistrictName(
              response.result!.country!,
              response.result!.jobCategoryId!,
              response.result!.jobServiceId!);
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
