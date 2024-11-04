import 'package:findpro/common/services/model/user_model.dart';

abstract class FollowOperation {
  Future<String?> follow(int userId, int followUserId, bool follow);
  Future<List<UserModel>?> following(int userId);
  Future<List<UserModel>?> followers(int userId);
}
