import 'package:findpro/common/services/model/request/search_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchInputViewModel extends StateNotifier<SearchRequest> {
  SearchInputViewModel() : super(SearchRequest());

  bool isFieldsEmpty = false;
  Future<void> isFieldEmpty() async {
    isFieldsEmpty = state.cityId == null &&
        state.districtId == null &&
        state.jobCategoryId == null &&
        state.jobServiceId == null;
  }

  int? get cityId => state.cityId;
  set cityId(int? cityId) {
    state = state.copyWith(cityId: cityId);
  }

  int? get districtId => state.districtId;
  set districtId(int? districtId) {
    state = state.copyWith(districtId: districtId);
  }

  int? get categoryId => state.jobCategoryId;
  set categoryId(int? categoryId) {
    state = state.copyWith(jobCategoryId: categoryId);
  }

  int? get serviceId => state.jobServiceId;
  set serviceId(int? serviceId) {
    state = state.copyWith(jobServiceId: serviceId);
  }
}

final searchInputProvider =
    StateNotifierProvider<SearchInputViewModel, SearchRequest>(
  (ref) => SearchInputViewModel(),
);
