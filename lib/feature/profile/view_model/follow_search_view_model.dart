import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final followSearchProvider =
    StateNotifierProvider<FollowSearchViewModel, List<FollowerModel>>(
        (ref) {
  return FollowSearchViewModel();
});

class FollowSearchViewModel extends StateNotifier<List<FollowerModel>> {
  FollowSearchViewModel() : super([]);

  void onSearchUser(String query, List<FollowerModel> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) =>
              element.fullName != null &&
              element.fullName!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
      state = result;
    }
  }
}
