import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/job_service.dart';
import 'package:findpro/feature/jobs/add_job/model/job_add_model.dart';
import 'package:riverpod/riverpod.dart';

class AddJobViewModel extends StateNotifier<JobAddModel> {
  AddJobViewModel() : super(JobAddModel());

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

  int? get hourlyWage => state.hourlyWage;
  set hourlyWage(int? hourlyWage) {
    state = state.copyWith(hourlyWage: hourlyWage);
  }

  String? get description => state.description;
  set description(String? description) {
    state = state.copyWith(description: description);
  }

  Future<bool> createService() async {
    final userId = CacheManager.instance.getUserId();
    final currentCountry = CacheManager.instance.getCountry();
    final res = await JobService.instance.add(JobAddModel(
        cityId: state.cityId,
        hourlyWage: state.hourlyWage,
        userId: userId,
        country: currentCountry,
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
