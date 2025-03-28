import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/job_service.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:riverpod/riverpod.dart';

class SavedJobsViewModel extends StateNotifier<List<JobModel>> {
  SavedJobsViewModel() : super([]);

  Future<bool> getJobs() async {
    final jobIdsString = CacheManager.instance.getSavedJobs();
    if (jobIdsString.isEmpty) {
      return false;
    }
    final jobIds =
        jobIdsString.map(int.tryParse).whereType<int>().toList();

    final res = await JobService.instance.getMultipleJobs(jobIds);
    if (res!.success) {
      state = res.result!;
      return true;
    }
    return false;
  }

  void saveJob(int jobId) {
    CacheManager.instance.saveJob(jobId.toString());
    if (!state.any((job) => job.jobId == jobId)) {
      state = [...state, JobModel(jobId: jobId)];
    }
  }

  void removeJob(int jobId) {
    CacheManager.instance.removeJob(jobId.toString());
    state = state.where((job) => job.jobId != jobId).toList();
  }

  void clearSavedJobs() {
    CacheManager.instance.clearJobs();
    state = [];
  }
}

final savedJobsProvider =
    StateNotifierProvider<SavedJobsViewModel, List<JobModel>>(
        (ref) => SavedJobsViewModel());

final savedJobsFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success = await ref.read(savedJobsProvider.notifier).getJobs();
    return success;
  },
);
