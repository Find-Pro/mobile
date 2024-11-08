import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/job_service.dart';
import 'package:findpro/feature/add_job/model/job_add_model.dart';
import 'package:riverpod/riverpod.dart';

class AddJobViewModel extends StateNotifier<JobAddModel> {
  AddJobViewModel() : super(JobAddModel(userId: 0));

  int? get cityId => state.cityId;
  set cityId(int? cityId) {
    state = state.copyWith(cityId: cityId);
  }

  int? get districtId => state.districtId;
  set districtId(int? districtId) {
    state = state.copyWith(districtId: districtId);
  }

  int? get categoryId => state.categoryId;
  set categoryId(int? categoryId) {
    state = state.copyWith(categoryId: categoryId);
  }

  int? get serviceId => state.serviceId;
  set serviceId(int? serviceId) {
    state = state.copyWith(serviceId: serviceId);
  }

  String? get description => state.description;
  set description(String? description) {
    state = state.copyWith(description: description);
  }

  Future<bool> createService() async {
    final userId = CacheManager.instance.getUserId();
    final res = await JobService().add(JobAddModel(
        cityId: state.cityId,
        userId: userId,
        districtId: state.districtId,
        categoryId: state.categoryId,
        serviceId: state.serviceId,
        description: state.description));

    if (res != null) {
      if (res.success) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void clear() {
    state = JobAddModel();
  }
}

final addJobProvider = StateNotifierProvider<AddJobViewModel, JobAddModel>(
    (ref) => AddJobViewModel());
