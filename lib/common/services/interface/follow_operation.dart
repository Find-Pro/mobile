import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/user_model.dart';

abstract class FollowOperation {
  Future<SuccessAndMessageResponse?> follow(
      int userId, int followUserId, bool follow);
  Future<List<UserModel>?> following(int userId);
  Future<List<UserModel>?> followers(int userId);
}
