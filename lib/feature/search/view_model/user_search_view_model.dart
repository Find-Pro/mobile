import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/services/model/response/follow_list_response.dart';
import 'package:findpro/common/services/routes/search_service.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSearchViewModel extends StateNotifier<FollowListResponse> {
  UserSearchViewModel() : super(FollowListResponse());

  Future<void> search(String query) async {
    state = FollowListResponse(result: []);

    if (query.isEmpty) {
      state = FollowListResponse(result: []);
      return;
    }
    final res = await SearchService.instance.searchUser(query);
    if (res == null || (res.result?.isEmpty ?? true)) {
      state = FollowListResponse(
        message: LocaleKeys.noUserFound.tr(),
      );
      return;
    }
    state = res;
  }

  void clearResults() {
    state = state.copyWith(result: []);
  }
}

final userSearchProvider =
    StateNotifierProvider<UserSearchViewModel, FollowListResponse>(
  (ref) => UserSearchViewModel(),
);
