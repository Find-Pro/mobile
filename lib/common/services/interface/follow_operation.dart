import 'package:findpro/common/services/model/response/follow/follow_list_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/profile/model/follow_number_box_model.dart';

abstract class FollowOperation {
  Future<SuccessAndMessageResponse?> follow(
      int userId, int followUserId, bool follow);

  Future<FollowListResponse?> following(int userId);

  Future<FollowListResponse?> followers(int userId);

  Future<FollowNumberBoxModel?> count(int userId);
}
